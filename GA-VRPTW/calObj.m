function ObjV = calObj(Chrom,cusnum,a,b,L,s,dist)
    n = size(Chrom,1);                         
    ObjV=zeros(n,1);                        
    for i=1:n
        [VC,NV,TD,violate_num,vioFlate_cus]=decode(Chrom(i,:),cusnum,a,b,L,s,dist);
        ObjV(i) = travel_distance(VC,dist);
    end
end
