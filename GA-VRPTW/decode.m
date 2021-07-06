% input: 
% chrom ---------- one single chroms
% cusnum --------- number of customers
% a, b ----------- time window
% L -------------- latest arrival time to depot

% output:
% VC ------------- customers of every robots
% NV ------------- number of vehicles/ robots
% TD ------------- total distance

% seperate a chromosome to several routes 

function [VC, NV, TD, violate_num, violate_cus] = decode(chrom, customer_number, a, b, L, service_time, dist)
  violate_num = 0;
  violate_cus = 0;
  VC = cell (customer_number, 1);
  count = 1;
  % 选取最后的几个点，作为分割位置
  % 最后几个位置是随便加的，在change.m中
  location0 = find(chrom > customer_number); % 找到这几个随便加的点
  for i = 1:length(location0)
    if i == 1
      % create a new route, include the number of depot
      route = chrom(1:location0(i));
      % delete the number of depot at the end
      route(route == chrom(location0(i))) = [];
    else
      route = chrom(location0(i - 1):location0(i));
      route(route == chrom(location0(i - 1))) = [];
      route(route == chrom(location0(i))) = [];
    end
    VC{count} = route; % add the route to set
    count = count + 1;
  end
  % for the last route
  if isempty(location0)
      route = chrom;
  else
      route = chrom(location0(end) : end);
      route(route == chrom(location0(end))) = [];
  end
  VC{count} = route;
  % delete empty routes, and get the number of vehicles
  [VC,NV]=deleteEmptyRoutes(VC);          
  for j=1:NV
    route = cell(1,1);                                
    route{1} = VC{j}; % pick up one route
    flag=Judge(route,a,b,L,service_time,dist);
    if flag==0
        violate_cus = violate_cus + length(route{1});   
        violate_num = violate_num + 1;                  
    end
  end
  TD=travel_distance(VC,dist);                        

end