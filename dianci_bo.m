%ƽ���Ų��Ĵ���
%��x�����򴫲�
%Ϊ�˷��㣬���ù���Ϊc=1,��E=B,�糡���ڴų�
%��糡���ֵEm=2
% ��k =1,w=1
clear
close all
Em=2;       %�糡ǿ�����ֵ
x =0:0.05:6*pi;    

tem=zeros(size(x));    %���ã��糡��ų��໥��ֱ���ֱ���һ�������Ϸ���Ϊ0
E =zeros(size(x));     %��ʼ���ռ�糡ǿ����ֵ��ȫΪ��

axis([0 ,20 -2 ,2 -2, 2])   %�����������С
xlabel('��������'),ylabel('�糡'),zlabel('�ų�')
hold on

% �ռ��ʼ��ų�ͼ��
H_E=plot3(x,E,tem,'linewidth',1.5);
H_B=plot3(x,tem,E,'linewidth',1.5);

tem2=~mod(x,0.5);
S_E=stem(x(tem2),E(tem2),'r.');
S_B=stem3(x(tem2),tem(tem2),E(tem2),'b.');

pause  %��ͣһ�£����ո���ɼ���������ͣ�������������۲�ͼ��Ƕ�
k=1;
filename='dongtu_7.gif';
%����gif��ͼ
while k<=length(x)
    
    E= [Em*sin(x(k)),E(1:end-1)];

    set(H_E,'YData',E);
    set(S_E,'YData',E(tem2))  %���µ糡ͼ��
    set(H_B,'ZData',E);
    set(S_B,'zData',E(tem2))  %���´ų�ͼ��
    drawnow limitrate
    
    F = getframe(gcf);    %������ʾ����Ļ�ϵĵ�ǰ��������ΪӰƬ֡
   im = frame2im(F);      %������ӰƬ֡������ͼ������
   [I,map] = rgb2ind(im,256);  % ������ת��Ϊrgb��ʽ
   if k == 1
       imwrite(I,map, filename,'GIF', 'Loopcount',inf,'DelayTime',0.05);
   else
       imwrite(I,map,filename,'WriteMode','append','DelayTime',0.05);
   end
    k=k+1;
end
drawnow







