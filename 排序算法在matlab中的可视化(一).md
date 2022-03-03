# 排序算法在matlab中的可视化（一）

## 冒泡排序

之前在b站看到有网友做常用排序算法的可视化，自己手痒也做了一下

### 1）算法描述
 	冒泡排序（Bubble Sort），如其名，第一轮，从左往右，相邻的两个数依次比较，左边比右边大则交换位置，直到最后两个数，这样把最大的那个数放到了最后（升序，降序则相反）。重复上述步骤，经过n-1轮，数组就从小到大排列好了。就像从气泡从水底上升到水面，会渐渐变大（有时间试试模拟下）；

### 2）代码实现及其可视化



```matlab
clear
%close all
list_1 =randperm(50); %测试数据，1-50不重复的随机排列整数
%randperm(40)   [randperm(25),randperm(25)-26] 测试数据
N=length(list_1);    %数组长度
stem(list_1,'^','r'); %画原始数据的图，或者用bar(),plot()都可以
pause  %暂停观察图像及数据，（点击图像，然后按任意按键可继续）

%主体程序
for nk=(N-1):-1:1
    
    for k=1:nk
        tem = list_1(k);  %第k个数
        if list_1(k)>list_1(k+1)
            list_1(k)=list_1(k+1);
            list_1(k+1)=tem;
        end
        %画图
        drawnow  %更新图窗并处理任何挂起的回调
        stem(list_1,'^','r');
        pause(0.05)   %暂停0.05秒，这里有时候有可能使显示效果变差，可不要
    end
    end
end 
```

#### 1）测试数据 为randperm(50)时，1-50无重复的随机整数数组，gif效果图如下

<img src="D:\matlab_mypj\mao_pao1.gif" alt="mao_pao1" style="zoom:67%;" />

#### 2) 测试数据为  [randperm(25),randperm(25)-26] 效果更明显，更容易理解

<img src="D:\matlab_mypj\mao_pao2.gif" alt="mao_pao2" style="zoom:67%;" />

（效果图不代表实际运行速度）

### 3）制作gif格式图片

可参考我之前gif如何制作的随笔

所有代码如下

```matlab

clear
% close all
list_1 =randperm(50); %测试数据，1-40不重复的随机排列整数
N=length(list_1);    %数组长度

len_fig=1;  %某一帧图像（数据）的下标
fig=figure;
stem(list_1,'^','r'); %画原始数据的图
Fra = getframe(fig);  %捕捉当前名为 fig 标识的窗口
img{len_fig}=frame2im(Fra); %返回与某一影片帧（图片）关联的图像数据
pause    %暂停观察图像及数据，（点击图像，然后按任意按键可继续

%主体程序
for nk=(N-1):-1:1
    
    better = 0; %设置一个优化条件
    for k=1:nk
        tem = list_1(k);
        if list_1(k)>list_1(k+1)
            list_1(k)=list_1(k+1);
            list_1(k+1)=tem;
            better =1;
        end
        
        drawnow
        stem(list_1,'^','r');
        
        % 保存当前图像数据
        len_fig=len_fig+1;
        Fra = getframe(fig);
        img{len_fig}=frame2im(Fra);  %保存当前图像数据
%         pause(.05);
    end
    if better==0  %如果better=0,说明这一轮没有发生交换，顺序是好的
        break;    %没必要进行下一轮（但是根据观察，只有一些顺序性较好的或者数据量大时，优化程度才较大）
    end
end 

%利用保存的数据制作gif图并保存
filename='mao_pao1.gif';  %保存gif的文件名
for ii=1:len_fig
    [I_map,map] =rgb2ind(img{ii}, 256); %将数据转为图像
    if ii ==1
        imwrite(I_map, map,filename,'gif','Loopcount',inf,'DelayTime',0.05)
    else
        imwrite(I_map, map,filename,'gif','WriteMode','append','DelayTime',0.05)
    end
end
```

###  4）冒泡算法的一种优化及其简单分析

冒泡算法的时间复杂度是O(n2)

上组代码中，17行，23行，33-35行是冒泡算法最常见的一种优化

```matlab
   better = 0; %设置优化条件
   ''''''''
   better =1;
   ''''''''
   if better==0  %如果better=0,说明这一轮没有发生交换，顺序是好的
        break;    %没必要进行下一轮（但是根据观察，只有一些顺序性较好的或者数据量大时，优化程度才较大）
   end
   ''''''''
```

但是这种优化，对于顺序性差的且大量数据（比如最小的数位于最后一位时，仍然要经历n(n-1)/2 次比较），效果一般。

而顺序性好的数据（小的数集中于左边，大的数集中于右边），一般可遇不可求。（自己可以设计一个，但是没什么意义）



（如有错漏，欢迎留言指出，友好交流）

