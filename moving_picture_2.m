%画螺旋图，制作gif
clear 
close all  %关闭所有图形窗口
t=0:0.1:6*pi;
x=sin(t);
y=cos(t);
z =2*t;
hh=plot3(x,y,z,'b','linewidth',2);
h = animatedline('color','r','linewidth',1,'marker','>');

filename='dongtu_4.gif';
for k = 1:length(t)
   addpoints(h,x(k),y(k),z(k))
   drawnow
   pause(0.1)
   
   F = getframe(gcf);
   im = frame2im(F);
   [I,map]= rgb2ind(im,256);
   if k == 1
       imwrite(I,map, filename,'GIF', 'Loopcount',inf,'DelayTime',0.1);
   else
       imwrite(I,map,filename,'WriteMode','append','DelayTime',0.1);
   end
end
