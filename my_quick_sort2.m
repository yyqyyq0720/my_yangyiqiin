% 快速排序，非递归方法函数
function [mylist_1,L]=my_quick_sort2(mylist_1,my_L,my_R)

% list_1 =[randperm(12)，2，3，0];  测试序列
% N=length(list_1);

% 递归返回条件，最小边界
if my_L>=my_R
    return
end


%%%%并且这不会增加时间复杂度，因为下面循环的时间复杂度是O(n)
%%%%而快速算法时间复杂度是O（nlogn）-O(n^2)
ki=1;
for ii=my_L:my_R-1
    if mylist_1(ii)>mylist_1(ii+1)
        ki=0;
         break
    end
end
if ki==1
    return
end

%初始化
L=my_L;   %左边数据下标，
R=my_R;   %右边数据下标
tem = mylist_1(L);  %基准数

%%%主体程序，用于找基准数该去的位置
while L<R
    %%%从右往左找比tem小的值，比tem小就停止循环（并且L<R）
    %%%这里并不需要对比tem大的值进行操作
    while tem<=mylist_1(R) && L<R
        R = R-1;
    end
    if L<R
        mylist_1(L)=mylist_1(R); %将小值转移到基准数tem左边  
    end
    
    %%%从左往右找比tem大的值，比tem小就停止
    %%%这里并不需要对比tem小的值进行操作
    while tem>mylist_1(L) && L<R
       L=L+1;
    end
    if L<R
        mylist_1(R)=mylist_1(L); %将大值转移到基准数tem右边
    end
end
   mylist_1(L)=tem;%将基准值放到相应位置






