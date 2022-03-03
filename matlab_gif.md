# matlab gif动图的制作

参考资料：

https://zhuanlan.zhihu.com/p/81860696

https://ww2.mathworks.cn/matlabcentral/answers/94495-how-can-i-create-animated-gif-images-in-matlab

https://ww2.mathworks.cn/help/matlab/ref/imwrite.html?s_tid=srchtitle

https://ww2.mathworks.cn/help/matlab/animation-1.html?s_tid=CRUX_lftnav

https://ww2.mathworks.cn/help/matlab/ref/getframe.html

### 核心函数

1. imwrite  将图像写入图形文件

   `imwrite(A,filename)` 将图像数据 `A` 写入 `filename` 指定的文件，并从扩展名推断出文件格式。`imwrite` 在当前文件夹中创建新文件。输出图像的位深取决于 `A` 的数据类型和文件格式。对于大多数格式来说：

   - 如果 `A` 属于数据类型 `uint8`，则 `imwrite` 输出 8 位值。

   - 如果 `A` 属于数据类型 `uint16` 且输出文件格式支持 16 位数据（JPEG、PNG 和 TIFF），则 `imwrite` 将输出 16 位的值。如果输出文件格式不支持 16 位数据，则 `imwrite` 返回错误。

   - 如果 `A` 是灰度图像或者属于数据类型 `double` 或 `single` 的 RGB 彩色图像，则 `imwrite` 假设动态范围是 [0,1]，并在将其作为 8 位值写入文件之前自动按 255 缩放数据。如果 `A` 中的数据是 `single`，则在将其写入 GIF 或 TIFF 文件之前将 `A` 转换为 `double`。

   - 如果 `A` 属于 `logical` 数据类型，则 `imwrite` 会假定数据为二值图像并将数据写入位深为 1 的文件（如果格式允许）。BMP、PNG 或 TIFF 格式以输入数组形式接受二值图像。

     如果 `A` 包含索引图像数据，则应另外指定 `map` 输入参数。



​		`imwrite(A,map,filename)` 将 `A` 中的索引图像及其关联的颜色图写入由 `map` `filename` 指定的文件。

  - ​	如果 `A` 是属于数据类型 `double` 或 `single` 的索引图片，则 `imwrite` 通过从每个元素中减去 1 来将索引转换为从 0 开始的索引，然后以 `uint8` 形式写入数据。如果 `A` 中的数据是 `single`，则在将其写入 GIF 或 TIFF 文件之前将 `A` 转换为 `double`

    `imwrite(___,fmt)` 以 `fmt` 指定的格式写入图像，无论 `filename` 中的文件扩展名如何。您可以在任何先前语法的输入参数之后指定 `fmt`。

    `imwrite(___,Name,Value)` 使用一个或多个名称-值对组参数，以指定 GIF、HDF、JPEG、PBM、PGM、PNG、PPM 和 TIFF 文件输出的其他参数。您可以在任何先前语法的输入参数之后指定 `Name,Value`。
    
    

2. getframe

      F = getframe
      
      `F = getframe` 捕获显示在屏幕上的当前坐标区作为影片帧。`F` 是一个包含图像数据的结构体。`getframe` 按照屏幕上显示的大小捕获这些坐标区。它并不捕获坐标区轮廓外部的刻度标签或其他内容。
      
      
      
      F = getframe(ax)
      
      `F = getframe(ax)` 捕获 `ax` 标识的坐标区而非当前坐标区。
      
      
      
      F = getframe(fig)
      
      `F = getframe(fig)` 捕获由 `fig` 标识的图窗。如果您需要捕获图窗窗口的整个内部区域（包括坐标区标题、标签和刻度线），则指定一个图窗。捕获的影片帧不包括图窗菜单和工具栏。
      
      
      
      F = getframe(___,rect)
      
      `F = getframe(___,rect)` 捕获 `rect` 定义的矩形内的区域。指定 `rect` 作为 `[left bottom width height]` 形式的四元素向量。将此选项用于上一语法中的 `ax` 或 `fig` 输入参数。
      
      

3. frame2im:该函数功能是”返回与影片帧关联的**图像数据“**。

   函数语法：[X,map]=frame2im(F),X是索引图像数据，map为关联的颜色图。

   

4. ind2rgb()

   `RGB = ind2rgb(X,map)` 将索引图像 `X` 和对应的颜色图 `map` 转换为 RGB（真彩色）格式



### 螺旋图



```matlab
%画螺旋图，制作gif
clear 
close all  %关闭所有图形窗口
t=0:0.1:6*pi;
x=sin(t);
y=cos(t);
z =2*t;
hh=plot3(x,y,z,'b','linewidth',2);
h = animatedline('color','r','linewidth',1,'marker','>');

filename='dongtu_4.gif';  %图片名称

for k = 1:length(t)
% 画动图
   addpoints(h,x(k),y(k),z(k))
   drawnow
   pause(0.1)
   
   F = getframe(gcf);    %捕获显示在屏幕上的当前坐标区作为影片帧
   im = frame2im(F);     %返回与影片帧关联的图像数据
   [I,map] = rgb2ind(im,256);  % 将数据转换为rgb格式
   if k == 1
       imwrite(I,map, filename,'GIF', 'Loopcount',inf,'DelayTime',0.1);
   else
       imwrite(I,map,filename,'WriteMode','append','DelayTime',0.1);
   end
end
%imwrite 将 GIF 文件写入您的当前文件夹。名称-值对组 'LoopCount',Inf 使动画连续循环。'DelayTime',1 在每个动画图像显示之间指定了0.1秒的时滞
```

<img src="D:\matlab_mypj\dongtu_4.gif" alt="dongtu_4" style="zoom:67%;" />





### 平面简谐电磁波的传播

1. 理论

   参考资料：《大学物理》（任意版本）、《matlab可视化大学物理学》周群益等著

   根据麦克斯韦方程组，可以推导并将电磁波表示为：

   $E = E_msin(k*x-w*t)$

   $B = B_msin(k*x-w*t)$

   注意到  1）光速 $c =\frac{E}{B}$  , 所以只需计算其一即可，可是光速为1

   ​			 2)   E与B相互垂直，且 $\frac{1}{\mu_0}\vec E\times\vec B=\mathbf{\vec S}$  波印亭矢量波的传播方向和能量传输方向
   
   

```matlab
%平面电磁波的传播
%沿x正方向传播
%为了方便，设置光速为c=1,则E=B,电场等于磁场
%设电场最大值Em=2
% 设k =1,w=1
clear
close all
Em=2;       %电场强度最大值
x =0:0.05:6*pi;    

tem=zeros(size(x));    %备用，电场与磁场相互垂直，分别在一坐标轴上分量为0
E =zeros(size(x));     %初始化空间电场强度数值，全为零

axis([0 ,20 -2 ,2 -2, 2])   %设置坐标轴大小
xlabel('传播方向'),ylabel('电场'),zlabel('磁场')
hold on

% 空间初始电磁场图像
H_E=plot3(x,E,tem,'linewidth',1.5);
H_B=plot3(x,tem,E,'linewidth',1.5);

tem2=~mod(x,0.5);
S_E=stem(x(tem2),E(tem2),'r.');
S_B=stem3(x(tem2),tem(tem2),E(tem2),'b.');

pause  %暂停一下，按空格键可继续，可以停下来用鼠标调整观察图像角度
k=1;
filename='dongtu_7.gif';
%制作gif动图
while k<=length(x)
    
    E= [Em*sin(x(k)),E(1:end-1)];

    set(H_E,'YData',E);
    set(S_E,'YData',E(tem2))  %更新电场图像
    set(H_B,'ZData',E);
    set(S_B,'zData',E(tem2))  %更新磁场图像
    drawnow limitrate
    
    F = getframe(gcf);    %捕获显示在屏幕上的当前坐标区作为影片帧
   im = frame2im(F);      %返回与影片帧关联的图像数据
   [I,map] = rgb2ind(im,256);  % 将数据转换为rgb格式
   if k == 1
       imwrite(I,map, filename,'GIF', 'Loopcount',inf,'DelayTime',0.05);
   else
       imwrite(I,map,filename,'WriteMode','append','DelayTime',0.05);
   end
    k=k+1;
end
drawnow

```

默认角度：

<img src="D:\matlab_mypj\dongtu_5.gif" alt="dongtu_5" style="zoom:67%;" />

调整一下观察角度：

<img src="D:\matlab_mypj\dongtu_6.gif" alt="dongtu_6" style="zoom:67%;" />![dongtu_7](D:\matlab_mypj\dongtu_7.gif)

![dongtu_7](D:\matlab_mypj\dongtu_7.gif)

