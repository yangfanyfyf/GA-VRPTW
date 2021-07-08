% convert the route(cell) to a single chromosome
function chrom = route2Chrom(VC, N, cusnum)
  % N是考虑到depot的长度，cuscum只有顾客个数
  NV = size(VC, 1); % number of routes
  chrom = [];
  % for every route, in one chrom
  for i = 1 : NV
    % add depot
    if (cusnum + i) <= N
      chrom = [chrom, VC{i}, cusnum + i];
    else
      chrom = [chrom, VC{i}];
    end
  end
  if length(chrom) < N
    supply = (cusnum + NV + 1) : N;
    chrom = [chrom, supply];
  end
  
end