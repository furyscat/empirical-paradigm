data = xlsread('文献数据.xlsx');
% 获取数据的行数
[numRows, ~] = size(data);

% 初始化一个结果数组
results = zeros(numRows, 1);

% 循环逐行计算
for row = 1:numRows
    N2 = data(row, 1);
    CO2 = data(row, 2);
    H2S = data(row, 3);
    C1 = data(row, 4);
    C2 = data(row, 5);
    C3 = data(row, 6);
    C4 = data(row, 7);
    C5 = data(row, 8);
    C6 = data(row, 9);
    C7 = data(row, 10);
    SGC7 = data(row,11);
    MWC7 = data(row, 12);
    T = data(row, 13);
    % 调用你的方程进行计算

    result = myEquation(N2,CO2,H2S,C1,C2,C3,C4,C5,C6,C7,MWC7,SGC7,T);
    % 将结果存储在结果数组中
    results(row) = result;
    disp(result);
end

function  pd= myEquation(N2,CO2,H2S,C1,C2,C3,C4,C5,C6,C7,MWC7,SGC7,T)
        b1 = 201.85481*(C7*((T*(((C3-(H2S-CO2))-(C6-(CO2-C4)))-C2)-((C4*(((CO2-C4)-(MWC7-N2))-(MWC7*MWC7*C5)))-C7))-(H2S-((N2*(T*(C1*C1-C7)))-(MWC7-(C2-H2S))))))+38456.879532*C6;
        b2 = 0.000007*((T*((((CO2-MWC7)-C7)*((T-MWC7)-(CO2-T)))-((H2S-T)*((MWC7-C3)*MWC7))))*N2)+225500.9399*C5;
        b3 = 120586.9719*(C1*((((H2S*C3)-(C5-C7))*H2S)-(((C7-C1)*(C7-C6))-(H2S*N2*N2))))+72.6908*MWC7;
        b4 = -1962.40851*(C5*(MWC7-C1*C1))-253385.67764*((C7*((CO2*C3)-(C4-C7)))*(CO2*(C3*(C3-MWC7))))-13358.85271*C4+4676.933602*C2-6567.9;
        pd=b1+b2+b3+b4;
end





