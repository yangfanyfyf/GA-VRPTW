function Chrom=Reins(Chrom,SelCh,ObjV)
    NIND = size(Chrom,1);
    NSel = size(SelCh,1);
    [TobjV,index] = sort(ObjV);
    Chrom = [Chrom(index(1 : NIND - NSel),:); SelCh];
end