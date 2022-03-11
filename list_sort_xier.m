%希尔排序，又称缩小增量排序，是对插入算法的改进
%调用插入排序选择函数版本
%1.分组,相隔 floor(N/2 )整数为一组
clear
list_1=[randperm(20),randperm(20)-21,2,2,20,20];
% [randperm(23),0,-5,4,4,4，30]     测试数据
N=length(list_1);
n=floor(N/2);

num_exchange=0;%交换次数

% stem(list_1)
while n>0
    kk =1;% k=1为每组数第一个数的下标  
    while kk<=n
        %调用插入排序函数
    [list_1(kk:n:N),num_exchange]=my_charu_func(list_1(kk:n:N),num_exchange);
    kk=kk+1;
    end
    
    n=floor(n/2);
    drawnow
   pause(.3)
    stem(list_1)
end
