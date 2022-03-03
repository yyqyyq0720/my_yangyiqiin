# 排序算法在matalb中的可视化（二）

## 插入排序

### 1）算法描述

（这里实现的是从小到大排列）

```matlab
把待排序的数组分成已排序和未排序两部分，初始的时候把第一个元素认为是已排好序的。
从第二个元素开始，在已排好序的子数组中寻找到该元素合适的位置并插入该位置。
重复上述过程直到最后一个元素被插入有序子数组中。
```



### 2）代码实现及其可视化

```matlab
clear,close all

list_1 =randperm(50);
N=length(list_1);  %数组的长度
%num_exchange=0;  %交换位置次数
stem(list_1,'^'); %可以换成bar(), 甚至plot()
%主体程序
for ii=2:N
    
    %从前往后，第二元素开始，分别按顺序与前一位元素比较 
    for k=(ii-1):-1:1
        %如果小于，则交换位置
        if list_1(k+1)<list_1(k)
            tem=list_1(k+1);
            list_1(k+1)=list_1(k);
            list_1(k)=tem;
             % num_exchange=num_exchange+1; %如果交换了位置，+1，为观察时间复杂度设置
            
        else
            %如果大于或等于，说明顺序是恰好排好的，没必要继续比较下去，
            break   
        end
        drawnow;
        stem(list_1,'^');
    end
end

```

#### 效果图一

<img src="D:\matlab_mypj\charu_1.gif" alt="charu_1" style="zoom:67%;" />

咋一眼看去，会可能感觉像反向的冒泡，其实不一样

#### 效果图二

可以明显看出跟冒泡算法是不一样的

<img src="D:\matlab_mypj\charu_2.gif" alt="charu_2" style="zoom:67%;" />

###  3）gif的制作等

输出 gif效果可以参考之前的随笔。

插入排序和冒泡排序的时间复杂度都是O(n2),都是简单易懂，易实现的算法。

（从小到大排列）

冒泡算法是每次循环将将（剩下的数中）最大值放到了最后位置；

而插入排序是每次循环是将一个数放入已经排好的序列中适当的位置。