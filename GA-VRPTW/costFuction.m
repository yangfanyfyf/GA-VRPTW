function [cost] = costFuction(curr_vc,a,b,s,L,dist)
    % 没有~默认输出第一个 
    [TD, ~] = travel_distance(curr_vc,dist);
    late_time = violateTW(curr_vc,a,b,s,L,dist);
    % the weight will influence the result.
    cost = TD + 10 * late_time;
end