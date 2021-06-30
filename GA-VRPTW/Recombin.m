function SelCh=Recombin(SelCh,Pc)
    NSel = size(SelCh,1);
    for i = 1:2:NSel-mod(NSel,2)
        % crossover probability
        if Pc >= rand 
            [SelCh(i,:),SelCh(i+1,:)] = Crossover(SelCh(i,:),SelCh(i+1,:));
        end
    end
end