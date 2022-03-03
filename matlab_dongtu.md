# matlab 一些动图

参考资料：matlab帮助中心https://ww2.mathworks.cn/help/index.html

## 线型动图

1. 核心函数

   1）***animateline***

   `an = animatedline` 创建一根没有任何数据的动画线条并将其添加到当前坐标区中。通过使用 `addpoints` 函数循环向线条中添加点来创建动画

   

   `an = animatedline(x,y)` 创建一根包含由 `x` 和 `y` 定义的初始数据点的动画线条。

   

   `an = animatedline(x,y,z)` 创建一根包含由 `x`、`y` 和 `z` 定义的初始数据点的动画线条。

   

   `an = animatedline(___,Name,Value)` 使用一个或多个名称-值对组参数指定动画线条属性。

   如，`'Color','r'` 将线条颜色设置为红色。在前面语法中的任何输入参数组合后使用此选项。

   

   `an = animatedline(ax,___)` 将在由 `ax` 指定的坐标区中，而不是在当前坐标区中创建线条。请在前面任何语法中的所有其他输入参数之前指定 `ax`。
   
   
   
   AnimatedLine 属性

   https://ww2.mathworks.cn/help/matlab/ref/matlab.graphics.animation.animatedline-properties.html

   

  2)   ***drawnow*** 更新窗口并处理回调

   `drawnow` 更新图窗并处理任何挂起的回调。如果您修改图形对象并且需要在屏幕上立即查看这次更新，请使用该命令。

   

   `drawnow limitrate` 将更新数量限制为每秒 20 帧。如果自上次更新后不到 50 毫秒，或图形渲染器忙于处理之前的更改，则 `drawnow` 会丢弃新的更新。如果您在循环中更新图形对象并且不需要在屏幕上查看每个更新，请使用该命令。跳过更新可以产生更快的动画。挂起的回调得到处理，这样您可以在动画期间与图窗交互。

   

   `drawnow nocallbacks` 会延迟回调（例如 `ButtonDownFcn` 回调），直至下个完整的 `drawnow` 命令执行。如果您想要阻止回调中断您的代码，请使用该选项。暂时延迟回调会禁用图窗交互，例如点击鼠标或调整图窗大小。延迟回调不会影响动画速度。

   

   `drawnow limitrate nocallbacks` 将更新数量限制为每秒 20 帧，如果渲染器繁忙则跳过更新。此语法还可以阻止回调中断您的代码，这样会暂时禁用图窗交互。

   

   如果渲染器繁忙，`drawnow update` 会跳过更新并延迟回调。不建议使用该语法。改用 `limitrate` 选项。

   

   `drawnow expose` 更新图窗但延迟回调。不建议使用该语法。改用 `nocallbacks` 选项。



​	3)  ***addpoints***  

​	向动画线条中添加点

​	`addpoints(an,x,y)` 向 `an` 指定的动画线条中添加 `x` 和 `y` 定义的点。使用 [`animatedline`](https://ww2.mathworks.cn/help/matlab/ref/animatedline.html) 函数创建一根动画线条。要在屏幕上显示更新，请使用 `drawnow` 或 `drawnow limitrate`。新点会自动连接到之前的点。



`addpoints(an,x,y,z)` 向 `an` 指定的三维动画线条中添加 `x`、`y` 和 `z` 定义的点。

2. 作图 ，二维

```matlab
% 画 sin()的动图
close all
x=0:0.05:2*pi;
y1=sin(x);
y2=cos(x);
axis([0 7 -1 1]);  %设定坐标轴大小

h = animatedline('color','r','linewidth',2);  %设置动画线条属性，可以默认

%  h = animatedline(x,y1);  会直接画出线条，而且是首尾相连，如无需要，不要使用

for k =1:length(x)
    addpoints(h,x(k),y1(k))
%     addpoints(h,x(k),y2(k))
    drawnow      %更新图窗并处理回调
    pause(0.1)   %可以不要，只是原来画的太快，加上pause让动图慢一点
end
```



<img src="D:\matlab_mypj\dongtu_2.gif" alt="dongtu_2" style="zoom:50%;" />

```matlab
% 画个有意思的，sin()与cos()点的组合，代码差不多
close all
x=0:0.05:2*pi;
y1=sin(x);
y2=cos(x);
axis([0 7 -1 1]);  %设定坐标轴大小

h = animatedline('color','r','linewidth',2);  %设置动画线条属性，可以默认


for k =1:length(x)
    addpoints(h,x(k),y1(k))
    addpoints(h,x(k),y2(k))    %这行代码，使得sin()与cos()上的点连起来
    drawnow
    pause(0.1)   %可以不要，只是原来画的太快，加上pause让动图慢一点
end
```

<img src="D:\matlab_mypj\dongtu_1.gif" alt="dongtu_1" style="zoom:50%;" />

3. 作图，三维螺旋图

   ```matlab
   clear 
   close all  %关闭所有图形窗口
   %计算螺旋线数据
   t=0:0.1:6*pi;
   x=sin(t);
   y=cos(t);
   z =2*t;
   hh=plot3(x,y,z,'b','linewidth',2);   %画出三维螺旋线图，以便比较
   
   
   h = animatedline('color','r','linewidth',1,'marker','>');  %设置线条属性
   
   % 不要使用h = animatedline(x,y,z,'color','r','linewidth',1,'marker','>'),会直接画出
   
   % 画动图
   for k = 1:length(t)
      addpoints(h,x(k),y(k),z(k))
      drawnow
      pause(0.1)
      
   end
   ```

   <img src="D:\matlab_mypj\dongtu_3.gif" alt="dongtu_3" style="zoom:67%;" />

