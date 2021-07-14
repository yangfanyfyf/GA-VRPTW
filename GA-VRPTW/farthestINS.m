function [fv, fviv, fvip, fvC] = farthestINS(removed,rfvc,L,a,b,s,dist)
    nr = length(removed);
    outcome = zeros(nr, 3);
    for i = 1 : nr
        % return the best [idx of veh, insert point, increased distance]
        [civ, cip, C] = cheapestIP(removed(i), rfvc, L, a, b, s, dist);
        outcome(i, 1) = civ;
        outcome(i, 2) = cip;
        outcome(i, 3) = C;
    end
    [mc, mc_index] = max(outcome(:, 3));
    temp = outcome(mc_index, :);
    fviv = temp(1, 1);
    fvip = temp(1, 2);
    fvC = temp(1, 3);
    fv = removed(mc_index);
end