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
        b1 = (13.145-4.942*C1+1961.71*C2-6212.71*C4+39335.07*C4*C4+2097*C5-3454.17*C6+201.93*H2S-0.065224*T)/(0.0031904*T+0.094398);
        b2 = (1367.4+9.98*C1*MWC7-1697.6*C3-5096.8*C7+358.07*log(C7)+933.35*CO2+1909.7*N2)/(1.0214-SGC7);
        pd=b1+b2;
end