function Chroms = createInitPopulation(POP, N, cusnum, init_vc)
  % N = number of customer + depots - 1
  Chroms = zeros(POP, N);
  
  chrom = route2Chrom(init_vc, N, cusnum);
  % just copy for POP times
  for j = 1 : POP
    Chroms(j, :) = chrom;
  end
end