# 排序算法在matlab中的可视化 (三)

## 选择排序

###  1）算法描述

序列  a[0],a[1],a[2]...a[n]，对它进行排序。先从0这个位置到n这个位置找出最小值，

然后将这个最小值与a[0]交换，然后，剩下的a[1]到a[n]就是接下来要排序的序列

可以从1这个位置到n这个位置找出最小值，然后将这个最小值与a[1]交换，
之后，剩下a[2]到a[n]就是接下来要排序的序列

每一次，都从序列中找出一个最小值，然后把它与剩下序列的第一个元素交换位置，
这样下去，待排序的元素就会越来越少，直到最后一个



关键点：每次循环要找出最小值及其下标

​            这件事，matalb的内置函数min()可以做到；其他语言也有的内置函数/库函数可以做类似的事情。当然，自己写也容易写出来。

###  2）代码以及可视化

```matlab
clear,close all
list_1 =[5,5,5,5 , randperm(51)-26 , -5,-5,-5,-5];%测试数据
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

bar(list_1);
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
    drawnow
    pause(.3)%暂停0.3秒 ,如果测试数据量大，不用也行
    bar(list_1,'r')
    my_title=strcat(tm,num2str(my_min));
    title(my_title);
end
```

<img src="D:\matlab_mypj\choice_sort.gif" alt="choice_sort" style="zoom:67%;" />

### 3）gif的制作代码

```matlab
clear,close all
list_1 =[5,5,5,5,randperm(51)-26,-5,-5,-5,-5];
N=length(list_1);

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
    %颜色
    len_hf=len_hf+1;
    if mod(len_hf,2)==0
        color_hf='w';
    else
        color_hf='k';
    end
    drawnow
    pause(.3)%暂停0.3秒 
    bar(list_1,color_hf)
    my_title=strcat(tm,num2str(my_min));
    title(my_title);
    %保存图像数据
    now_hf = getframe(hf);
    data_hf{len_hf} = frame2im(now_hf);
end
%利用保存的数据制图
filename='choice_sort3.gif';
for ii=1:len_hf
    [I_map,map] =rgb2ind(data_hf{ii}, 256);  %将数据转为图像
    if ii ==1
        imwrite(I_map, map,filename,'gif','Loopcount',inf,'DelayTime',0.5)
    else
        imwrite(I_map, map,filename,'gif','WriteMode','append','DelayTime',0.5)
    end
end
```



闪瞎我狗眼的图：

<img src="D:\matlab_mypj\choice_sort2.gif" alt="choice_sort2" style="zoom:67%;" />



<img src="D:\matlab_mypj\choice_sort3.gif" alt="choice_sort3" style="zoom:67%;" />

###  4) 简单分析

选择排序的时间复杂度与冒泡排序、插入排序一样，都是O(n2)

但是选择排序中，数组（序列）数据间交换的次数只有n-1次（最多）

