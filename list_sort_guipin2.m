%归拼排序 调用合拼函数
%本代码采用迭代形式，也可以用递归方法
%合拼在  list_messagge_sort.m函数体中
clear ，close all

list_1=[randperm(30),randperm(20)-20]; %序列（或者说数组）
N = length(list_1);                    %序列长度

bin_list_length=dec2bin(N);     %将N实现十进制与二进制转化，有大用

tem_len=2;       %第一轮迭代中使用
n= floor(N/2);   %向小取整，如 1.9—— 1，  -3.3—— -4，这里用其他语言

bar(list_1);     %画原始数据图（用其他语言可以忽略，或另寻可视化方法）
% pause             %暂停，观察原始数据图像，按空格键继续


%程序主体
%第一轮，进行2的某次方有关的数据排序
while n>0
    for k=1:n
        left_pt=(k-1)*tem_len+1;
        right_pt= k*tem_len;
        
        tem_list=list_messagge_sort(list_1(left_pt:right_pt));
        list_1(left_pt:right_pt)=tem_list;   %这里可以简化，tem_list非必要
    end
    n= floor(n/2);   
    tem_len=tem_len*2;  
    
    %画图
    drawnow
    pause(.4)  %暂停0.4秒，不然图像变化太快
    bar(list_1)
end
%第一轮的结果与N的二进制数字相关，如果数组的长度为2的n次方，
%那么第二轮其实不用了；但是比较符合2的n次方长度的数组毕竟是少数，要考虑普适性


nn = length(bin_list_length); %nn为N的二进制数字的长度，用于迭代
tem_n=nn-1;     %二进制数字的长度减一，用于迭代中，辅助数据的输入与更新
L =2^tem_n;     %同上，初始为序列（数组）中第一个有序序列的长度，也是暂时最大的
%  第二轮，迭代
for ii=2:nn
    
   % 如果数组的某2的n次方的分组数据为空，跳过
    if bin_list_length(ii)=='0'
        tem_n=tem_n-1;
        continue
    end
    if bin_list_length(ii)=='1'
        tem_n=tem_n-1;
        
        L2=2^tem_n;
        
        tem_list=list_messagge_sort(list_1(1:L), list_1(L+1:L+L2));
        list_1(1:L+L2)=tem_list;    %同理，这里也可以简化

        L=L+2^tem_n;
    end
    %继续画图
    drawnow
     pause(.4) %暂停0.4秒，不然图像变化太快，看不清，数据量大时可以不要
    bar(list_1)
end

% list_1




