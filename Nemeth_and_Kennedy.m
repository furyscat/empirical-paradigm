data = xlsread('文献数据1.xlsx');
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
        
        a=-2.0623054*(C2+CO2+H2S+C6+2*(C3+C4)+C5+0.4*C1+0.2*N2)+6.625973*SGC7-0.0044670559*(C1/(C7+0.002))+0.0001044835*T+0.03267371*(C7*MWC7)-0.0036453277*(C7*MWC7)^2+0.00007429995*(C7*MWC7)^3-0.11381195*(MWC7/(SGC7+0.0001))+0.000624765*(MWC7/(SGC7+0.0001))^2-0.0000010716866*(MWC7/(SGC7+0.0001))^3+1.746622;
        pd=exp(a);
end

