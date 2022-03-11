%冒泡排序，时间复杂度O( n2 )
% 从小到到
clear
% close all
% list_1=[2,1];
list_1 =[randperm(20),randperm(20)+20];
%randperm(40)测试数据，1-40不重复的随机排列整数
N=length(list_1);    %数组长度

len_fig=1;  %某一帧图像的下标
fig=figure;
stem(list_1,'^','r'); %画原始数组的图

% Fra = getframe(fig);  %捕捉当前名为 fig 标识的窗口
% img{len_fig}=frame2im(Fra); %返回与影片帧（图片）关联的图像数据

pause

for nk=(N-1):-1:1
    %主要程序
    better = 0; %设置优化条件
    for k=1:nk
        tem = list_1(k);
        if list_1(k)>list_1(k+1)
            list_1(k)=list_1(k+1);
            list_1(k+1)=tem;
            better =1;
        end
        len_fig=len_fig+1;
        drawnow
        stem(list_1,'^','r');
        % 保存当前图像数据
%         Fra = getframe(fig);
%         img{len_fig}=frame2im(Fra);
%         pause(.05);
    end
    if better==0  %如果better=0,说明这一轮没有发生交换，顺序是好的
        break;    %没必要进行下一轮（但是根据观察，只有一些顺序性较好的或者数据量大时，优化程度才较大）
    end
end 

%制作gif图并保存
% filename='mao_pao2.gif';  %保存gif的文件名
% for ii=1:len_fig
%     [I_map,map] =rgb2ind(img{ii}, 256);
%     if ii ==1
%         imwrite(I_map, map,filename,'gif','Loopcount',inf,'DelayTime',0.05)
%     else
%         imwrite(I_map, map,filename,'gif','WriteMode','append','DelayTime',0.05)
%     end
% end