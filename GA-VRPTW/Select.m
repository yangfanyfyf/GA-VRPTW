function SelCh = Select(Chrom,FitnV,GGAP)
    NIND = size(Chrom,1);
    NSel = max(floor(NIND*GGAP+.5),2);
    ChrIx = Sus(FitnV,NSel);
    % selected Chrom
    SelCh = Chrom(ChrIx,:);
end