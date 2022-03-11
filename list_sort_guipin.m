%归拼排序

% 合并的方法就是分别从两个有序序列中拿出一个数来进行比较，小的那一个放到新序列中，
% 然后，从这个小的数所属的序列中拿出一个数来继续比较
% 注意到这两个序列是要有序的
%{
归并排序，利用了合并有序序列的思想，把一个序列分成A,B两个序列，
如果这两个序列是有序的，直接合并他们，
但是A，B两个序列未必是有序的,就拿A序列来说，把A序列再分一次，
分成A1,A2，如果A1，A2有序,直接对他们进行合并，A变有序了，
但是A1，A2未必有序啊,继续分，直到分出来的序列里只有一个元素的时候，
一个元素，就是一个有序的序列啊，就可以合并了
这样一层一层的分组，分到最后，一个组里只有一个元素，终于符合合并的条件了，
再一层一层的向上合并
%}

%归拼排序,有两个需要关键点，如何拆分与如何合拼

%matlab 或许可以使用 num2cell()但是会使代码迁移性变弱


%实现合拼，可以将代码转为函数形式，便于调用

%{
对于两个任意两个 有序序列
测试数据
% list_2=[1 5 10 20];
% list_3=[2 4 6 8 10 14 20 20 45];
%}
clear

%测试数据
list_3=[3,3,5,6,9];
list_2=[3,7,8,10,11,13];

n1 = length(list_2);  %两个序列的长度
n2 = length(list_3);

N=n1+n2;
list_new=zeros(1,N); %预分配空间，优化过程

na=1; %list_2的索引
nb=1; %list_3的索引，或者说是下标
for k=1:N   %这里其实用while也行，只要注意跳出循环就行
    
    %增加判断，如果其中一个数组的元素已经全部在新数组中，只对另一个操作
    if na>n1
        list_new(k)=list_3(nb);
        nb=nb+1;
        continue
    end
    %同上
    if nb>n2
        list_new(k)=list_2(na);
        na=na+1;
        continue
    end
    %
    if list_2(na)<list_3(nb)
        list_new(k)=list_2(na);   %将较小值写入list_new中
        na =na+1;
    else 
        list_new(k)=list_3(nb);
        nb=nb+1;
    end 
    
end

%合拼最后一个数
% if list_2(end)>list_3(end)
%     list_new(end)=list_2(end);
% else
%     list_new(end)=list_3(end);
% end

list_new 


