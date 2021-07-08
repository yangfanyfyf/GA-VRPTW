function SelCh = Select(chroms,FitnV,GGAP)
    % number of total chromosomes
    N = size(chroms,1); 
    % number of selected chromosomes, depend on GGAP
    NSel = max(floor(N * GGAP + .5), 2); 
    ChrIx = Sus(FitnV,NSel);
    %ChrIx = randperm(100, 90);
    % selected Chrom
    SelCh = chroms(ChrIx,:);
end