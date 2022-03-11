%插入排序函数
%主要是为了使用希尔排序
function [list_1,num_exchange]=my_charu_func(list_1,num_exchange)
% num_exchange，交换次数，如果只输入数组，默认为0
if nargin==1
    num_exchange=0;
end
    
N=length(list_1);
for ii=2:N
    %从第二元素开始，分别按顺序与前一位元素比较 
    
    for k=(ii-1):-1:1 %从后往前，(这段可以用while)
        %如果小于，则交换位置
        if list_1(k+1)<list_1(k)
            tem=list_1(k+1);
            list_1(k+1)=list_1(k);
            list_1(k)=tem;
            num_exchange= num_exchange+1;%如果交换了位置，+1，为观察时间复杂度设置
%         else
%             break   %如果大于，说明顺序是恰好排好的，没必要继续比较下去
        end
    end
end