function Chrom = InitPopCW(POP, N, cusnum, init_vc)
  Chrom = zeros(POP, N);
  chrom = change(init_vc, N, cusnum);
  for j = 1 : POP
    Chrom(j, :) = chrom;
end