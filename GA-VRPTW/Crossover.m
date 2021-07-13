% Order Crossover, OX

function [a,b]=Crossover(a,b)
    L=length(a);
    while 1
        % generate a random number in the range [1:L]
        % 1. choose 2 points
        r1 = randsrc(1,1,[1:L]);
        r2 = randsrc(1,1,[1:L]);
        if r1 ~= r2
            % start and end
            s = min([r1,r2]);
            e = max([r1,r2]);
            % choose 2 parts of chromosome
            a0 = [b(s:e),a];
            b0 = [a(s:e),b];
            for i = 1:length(a0)
                aindex = find(a0==a0(i));
                bindex = find(b0==b0(i));
                % delete the same index
                if length(aindex) > 1
                    a0(aindex(2))=[];
                end
                
                if length(bindex) > 1
                    b0(bindex(2)) = [];
                end
                if i == length(a)
                    break
                end
            end
            a = a0;
            b = b0;
            break
        end
    end
end