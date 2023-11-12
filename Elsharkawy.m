

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
        pd=4268.85+0.094056*T-7157.87*H2S-4540.58*CO2-4663.55*N2-1357.56*C1-7776.1*C2-9967.99*C3-4257.1*C4-1417.1*C5+691.5298*C6+40660.36*C7+205.26*MWC7-7260.32*SGC7-352.413*(C7*MWC7)-114.519*(MWC7/SGC7)+8.133*((C7*MWC7)/SGC7)+94.916*(C7/(C1+C2))+238.252*(C7/(C3+C4+C5+C6));
    end


