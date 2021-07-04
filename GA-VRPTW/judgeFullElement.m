function flag = judgeFullElement(optimal_assignment, customer_number)
    NV = size(optimal_assignment,1);
    route = [];
    for i = 1:NV
        route = [route optimal_assignment{i}];
    end
    sorted_customer = sort(route);
    init_customer = 1:customer_number;
    %setxor(a,b)可以得到a,b两个矩阵不相同的元素，也叫不在交集中的元素
    flag = setxor(sorted_customer,init_customer);
end