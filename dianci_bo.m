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







