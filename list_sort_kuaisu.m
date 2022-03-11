%快速排序第一步，第一次分区，实现基准数左边是小于它
%右边的数大于基准的，quick sort,
%理解快速排序关键一步
%作用，找出第一个数在序列中的位置（下标）
%参考资料https://blog.csdn.net/morewindows/article/details/6684558(感谢大佬)
% list_1=randperm(11)

clear
list_1 =[2,randperm(30),2]; %测试序列
N=length(list_1);
%初始化
L=1;   %从左边数据下标，
R=N;   %右边数据下标
tem = list_1(L);  %基准数

%%%主体程序
while L<R
    %%%从右往左找比tem小的值，比tem小就停止循环（并且L<R）
    %%%这里并不需要对比tem大的值进行操作
    while tem<list_1(R) && L<R
        R = R-1;
        
    end
    list_1(L)=list_1(R);  %将小值转移到基准数tem左边
    
    %%%从左往右找比tem大的值，比tem小就停止
    %%%这里并不需要对比tem小的值进行操作
    while tem>list_1(L) && L<R
       L=L+1;
    end
    list_1(R)=list_1(L); %将大值转移到基准数tem右边
    
end
   L
   list_1(L)=tem;   %将基准值放到相应位置
   list_1

