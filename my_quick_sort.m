% 快速排序，函数
function [mylist_1,cells_list]=my_quick_sort(mylist_1,my_L,my_R,cells_list)

% list_1 =[randperm(12)，2，3，0];  测试序列
% N=length(list_1);

% 递归返回条件，最小边界
if my_L>=my_R
    return
end


% ki=1; % ki=1表示顺序是好的
% for ii=my_L:my_R-1
% % for ii=1:my_R-1
%     if mylist_1(ii)>mylist_1(ii+1)
%         ki=0;
%          break
%     end
% end
% if ki==1
%     return
% end
% %%%%第二个边界，这里这段非常重要，可以避免相互递归，可以大大降低运算时间
% %%%%并且这不会增加时间复杂度，因为下面循环的时间复杂度是O(n)
% %%%%而快速算法时间复杂度是O（nlogn）-O(n^2)



%初始化
L=my_L;   %左边数据下标，
R=my_R;   %右边数据下标
tem = mylist_1(L);  %基准数

%%%主体程序，用于找基准数该去的位置
while L<R
    %%%从右往左找比tem小的值，比tem小就停止循环（并且L<R）
    %%%这里并不需要对比tem大的值进行操作
    while  L<R && tem<mylist_1(R) 
        R = R-1;

    end
    if L<R
        mylist_1(L)=mylist_1(R); %将小值转移到基准数tem左边 
    end
    
    %%%从左往右找比tem大的值，比tem小就停止
    %%%这里并不需要对比tem小的值进行操作
    while L<R && tem>=mylist_1(L)
       L=L+1;
    end
    if L<R
        mylist_1(R)=mylist_1(L); %将大值转移到基准数tem右边
    end
end
  
   mylist_1(L)=tem;%将基准值放到相应位置
   
    cells_list=[cells_list;mylist_1];%%%发现并不符合
    


%基本可以确定，在matlab，下面两个递归相互影响，数据量大时，很复杂
%递归相互影响会导致产生大量重复序列数据
%这里先递归？？？？？？想不明白
[mylist_1,cells_list]=my_quick_sort(mylist_1,1,L-1,cells_list);
%后递归，但是这里会重复递归，有什么解决方法？？？？？？？？？
[mylist_1,cells_list]=my_quick_sort(mylist_1,L+1,my_R,cells_list);

