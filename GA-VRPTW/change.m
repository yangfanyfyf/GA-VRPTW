function chrom = change(VC, N, cusnum)
  NV = size(VC, 1);
  chrom = [];
  for i = 1 : NV
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