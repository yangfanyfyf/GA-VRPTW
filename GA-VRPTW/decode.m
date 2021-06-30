function [VC, NV, TD, violate_num, violate_cus] = decode(chrom, cusnum, a, b, L, s, dist)
  violate_num = 0;
  violate_cus = 0;
  VC = cell (cusnum, 1);
  count = 1;
  location0 = find(chrom > cusnum);
  % delete the number of depot
  for i = 1:length(location0)
    if i == 1
      route = chrom(1:location0(i));
      route(route == chrom(location0(i))) = [];
    else
      route = chrom(location0(i - 1):location0(i));
      route(route == chrom(location0(i - 1))) = [];
      route(route == chrom(location0(i))) = [];
    end
    VC{count} = route;
    count = count + 1;
  end
  route = chrom;
  % route = chrom(location0(end) : end);
  % route(route == chrom(location0(end))) = [];
  VC{count} = route; 
  [VC,NV]=deal_vehicles_customer(VC);                 
  for j=1:NV
    route=cell(1,1);                                
    route{1}=VC{j};
    flag=Judge(route,a,b,L,s,dist);     
    if flag==0
        violate_cus=violate_cus+length(route{1});   
        violate_num=violate_num+1;                  
    end
  end
  TD=travel_distance(VC,dist);                        

end