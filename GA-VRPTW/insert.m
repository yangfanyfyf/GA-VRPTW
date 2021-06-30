% 将元素插入回原始解中
function [ifvc, iTD] = insert(fv, fviv, fvip, fvC, rfvc, dist)
    ifvc = rfvc;
    [sumTD, ~] = travel_distance(rfvc, dist);
    iTD = sumTD + fvC;
    if fviv <= size(rfvc, 1)
        route = rfvc{fviv};
        len = length(route);
        if fvip == 1
            temp = [fv route];
        elseif fvip == len + 1
            temp = [route fv];
        else
            temp = [route(1:fvip - 1) fv route(fvip:end)];
        end
        ifvc{fviv} = temp;
    else
        ifvc{fviv, 1} = [fv];
    end
end