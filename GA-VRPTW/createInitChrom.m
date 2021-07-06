function [init_vc] = createInitChrom(cusnum, a)
  j = ceil(rand * cusnum); % select a random customer
  k = 1; % number of cars, or the number of routes, the initial value is 1
  init_vc = cell (k, 1); 
  % order to traverse all customers
  if j == 1 % first one
    seq = 1:cusnum;
  elseif j == cusnum % last one
    seq = [cusnum, 1 : j - 1];
  else % random customer in the middle
    seq1 = 1 : j - 1;
    seq2 = j : cusnum;
    seq = [seq2, seq1];
  end
  % traversal start
  route = []; % save the customer in each route
  i = 1; 
  while i <= cusnum
    if isempty(route) % if the route is empty, add customer
      route = [seq(i)];
    elseif length(route) == 1 % one customer, add new customer according to the left time window
      if a(seq(i)) <= a(route(1))
        route = [seq(i), route];
      else
        route = [route, seq(i)];
      end
    else
      lr = length(route);
      flag = 0;
      for m = 1 : lr - 1
        % time window constrains
        % find an interval
        if (a(seq(i)) >= a(route(m))) && (a(seq(i)) <= a(route(m + 1)))
          route = [route(1:m), seq(i), route(m + 1 : end)];
          flag = 1;
          break;
        end
      end
      % if no such interval, add it to the end
      if flag == 0
        route = [route, seq(i)];
      end
    end
    % the Last 
    if i == cusnum
      init_vc{k, 1} = route;
      break;
    end
    
    i = i + 1;
  end
end