function drawMap(VC,vertexs)
    customer=vertexs(2:end,:);                                      
    NV=size(VC,1);                                                  
    figure
    hold on;box on
    title('Optimal Roadmap')
    hold on;
    C = linspecer(NV);
    for i=1:NV
        part_seq=VC{i};            
        len=length(part_seq);
        for j=0:len
            if j==0
                fprintf('%s','Route',num2str(i),':');
                fprintf('%d->',0);
                c1=customer(part_seq(1),:);
                plot([vertexs(1,1),c1(1)],[vertexs(1,2),c1(2)],'-','color',C(i,:),'linewidth',1);
            elseif j==len
                fprintf('%d->',part_seq(j));
                fprintf('%d',0);
                fprintf('\n');
                c_len=customer(part_seq(len),:);
                plot([c_len(1),vertexs(1,1)],[c_len(2),vertexs(1,2)],'-','color',C(i,:),'linewidth',1);
            else
                fprintf('%d->',part_seq(j));
                c_pre=customer(part_seq(j),:);
                c_lastone=customer(part_seq(j+1),:);
                plot([c_pre(1),c_lastone(1)],[c_pre(2),c_lastone(2)],'-','color',C(i,:),'linewidth',1);
            end
        end
    end
    plot(customer(:,1),customer(:,2),'ro','linewidth',1);hold on;
    plot(vertexs(1,1),vertexs(1,2),'s','linewidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',10);
end