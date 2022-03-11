%选择排序，时间复杂度O(n2)
% 假设有一个序列，a[0],a[1],a[2]...a[n]现在，对它进行排序。我们先从0这个位置
% 到n这个位置找出最小值，然后将这个最小值与a[0]交换，然后呢，a[1]到a[n]就是我
% 们接下来要排序的序列
% 
% 我们可以从1这个位置到n这个位置找出最小值，然后将这个最小值与a[1]交换，
% 之后，a[2]到a[n]就是我们接下来要排序的序列
% 
% 每一次，我们都从序列中找出一个最小值，然后把它与序列的第一个元素交换位置，
% 这样下去，待排序的元素就会越来越少，直到最后一个

clear,close all
list_1 =[5,5,5,5,randperm(51)-26,-5,-5,-5,-5];
N=length(list_1);

%使用了内置函数 min()，很方便
% for k =1:N-1    
%    [tem_min, tem_position]=min(list_1(k:end));
%     tem =list_1(k);
%     list_1(k) =tem_min;
%     list_1(tem_position+k-1)=tem;
%     
%     pause(.1)
%     stem(list_1)   
% end
hf=figure;
len_hf=1;
bar(list_1);
now_hf=getframe(hf);
data_hf{len_hf}=frame2im(now_hf);

tm='该轮最小值';
tem_posit=0;  %初始最小值的下标，当然0下标在matlab是没有的
for ii=1:N-1
    
    t=0; %设置一个判断条件
    %找出最小值及其位置,相当于 min()函数
    my_min=list_1(ii);%设某一轮的第一个数为最小值
    for k=ii:N-1
        if my_min>list_1(k+1)
            my_min = list_1(k+1); %新的最小值
            tem_posit =k+1;       %最小值位置
            t=1;   %如果最小值更新，设置为1
        end
    end
    %交换位置,只有t=1时候才可以交换，t=0,说明list_1(ii)恰好在适当的位置
    if t==1
        tem = list_1(ii);
        list_1(ii) = my_min;
        list_1(tem_posit)=tem;
    end
    
    len_hf=len_hf+1;
    if mod(len_hf,2)==0
        color_hf='w';
    else
        color_hf='k';
    end
    drawnow
    pause(.3)%暂停0.3秒 ,使用 drawnow后，如果效果好，不用也行
    bar(list_1,color_hf)
    my_title=strcat(tm,num2str(my_min));
    title(my_title);
    
    now_hf = getframe(hf);
    data_hf{len_hf} = frame2im(now_hf);
end

filename='choice_sort3.gif';
for ii=1:len_hf
    [I_map,map] =rgb2ind(data_hf{ii}, 256);
    if ii ==1
        imwrite(I_map, map,filename,'gif','Loopcount',inf,'DelayTime',0.5)
    else
        imwrite(I_map, map,filename,'gif','WriteMode','append','DelayTime',0.5)
    end
end









