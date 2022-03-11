% 快速排序，非递归方法实现,调用my_quick_sort2.m
% http://data.biancheng.net/view/117.html,这个不是
% https://www.cnblogs.com/jing-an-feng-shao/p/9118376.html
%https://www.cnblogs.com/mist-lee/p/4770662.html

%要实现栈，后进先出，matlab似乎没有这样的东西

list_1=randperm(14);
N=length(list_1);
L=1;
R=N;
list_stack={L,R};

% isempty(list_stack{n})

