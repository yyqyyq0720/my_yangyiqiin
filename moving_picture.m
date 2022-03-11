close all
x=0:0.05:2*pi;
y1=sin(x);
y2=cos(x);
axis([0 7 -1 1]);

h = animatedline(x,y1,'color','r','linewidth',.5);

mark =1;
for k =1:length(x)
    addpoints(h,x(k),y1(k))
    addpoints(h,x(k),y2(k))
    drawnow
    pause(0.1)

%     F = getframe(gcf);
%     im = frame2im(F);
%     [I,map] = rgb2ind(im,256);
%     if mark == 1
%         imwrite(I,map,'dongtu_1.gif','GIF', 'Loopcount',inf,'DelayTime',0.1);
%         mark = mark + 1;
%     else
%         imwrite(I,map,'dongtu_1.gif','WriteMode','append','DelayTime',0.1);
%     end
end
% drawnow