function [cost] = costFuction(curr_vc,a,b,s,L,dist)
    [TD] = travel_distance(curr_vc,dist);
    [w]=violateTW(curr_vc,a,b,s,L,dist);
    cost = TD + 1 * w;
end