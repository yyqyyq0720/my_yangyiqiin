%归拼,合拼有序数组
function list_new = list_messagge_sort(my_list,my_list_1)
%判断，只输入一个数组 与输入两个数组的操作是不同的
switch nargin
    case 1
        N=length(my_list);
        N_half =round(N/2);
        
        my_list_2=my_list(1:N_half);
        my_list_3=my_list(N_half+1:end);
        n1 = length(my_list_2);  %两个序列的长度
        n2 = length(my_list_3);
    case 2
        my_list_2=my_list;
        my_list_3=my_list_1;
        n1 = length(my_list_2);  %两个序列的长度
        n2 = length(my_list_3);   
end

N=n1+n2;
%如果只输入一个数组，且该输入的数组有一个元素，不必要继续
if N<2
    list_new=my_list_2;
    return
end

list_new=zeros(1,N); %预分配空间，优化过程

na=1; %list_2的索引初值
nb=1; %list_3的索引初值，或者说是下标

%主体程序，迭代中合拼
for k=1:N   %这里其实用while也行，只要注意跳出循环就行
    
    %增加判断，如果其中一个数组的元素已经全部在新数组中，只对另一个操作
    if na>n1
        list_new(k)=my_list_3(nb);
        nb=nb+1;
        continue
    end
    %同上
    if nb>n2
        list_new(k)=my_list_2(na);
        na=na+1;
        continue
    end
    %%%%%
    if my_list_2(na)<my_list_3(nb)
        list_new(k)=my_list_2(na);   %将较小值写入list_new中
        na =na+1;
    else 
        list_new(k)=my_list_3(nb);
        nb=nb+1;
    end 
end



