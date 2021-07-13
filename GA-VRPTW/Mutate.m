function SelCh = Mutate(SelCh,Pm)
    [NSel,L] = size(SelCh);
    for i = 1:NSel
        if Pm >= rand
            % Random permutation of integers
            R = randperm(L);
            % choose 2 random number in ith chromosome
            SelCh(i,R(1:2)) = SelCh(i,R(2:-1:1));
        end
    end
end