function SelCh = neighborhoodSearch(SelCh, cusnum, a, b, L, s, dist)
    D = 15;
    to_remove = 5;
    [row, N] = size(SelCh);
    for i = 1: row
        [VC, NV, TD, violate_num, violate_cus] = decode(SelCh(i, :), cusnum, a, b, L, s, dist);
        CF = costFuction(VC,a,b,s,L,dist);
        % remove函数的作用是什么？？
        [removed, rfvc] = remove(cusnum, to_remove, D, dist, VC);
        % 函数缺失
        [ReIfvc, RTD] = ReInserting(removed, rfvc, L, a, b, s, dist);
        
        RCF = costFuction(ReIfvc,a,b,s,L,dist);
        if RCF < CF
            chrom = route2Chrom(ReIfvc, N, cusnum);
            if length(chrom) ~= N
                record = ReIfvc;
                break;
            end
            SelCh(i, :) = chrom;
        end
    end
end
