%ð������ʱ�临�Ӷ�O( n2 )
% ��С����
clear
% close all
% list_1=[2,1];
list_1 =[randperm(20),randperm(20)+20];
%randperm(40)�������ݣ�1-40���ظ��������������
N=length(list_1);    %���鳤��

len_fig=1;  %ĳһ֡ͼ����±�
fig=figure;
stem(list_1,'^','r'); %��ԭʼ�����ͼ

% Fra = getframe(fig);  %��׽��ǰ��Ϊ fig ��ʶ�Ĵ���
% img{len_fig}=frame2im(Fra); %������ӰƬ֡��ͼƬ��������ͼ������

pause

for nk=(N-1):-1:1
    %��Ҫ����
    better = 0; %�����Ż�����
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
        % ���浱ǰͼ������
%         Fra = getframe(fig);
%         img{len_fig}=frame2im(Fra);
%         pause(.05);
    end
    if better==0  %���better=0,˵����һ��û�з���������˳���Ǻõ�
        break;    %û��Ҫ������һ�֣����Ǹ��ݹ۲죬ֻ��һЩ˳���ԽϺõĻ�����������ʱ���Ż��̶ȲŽϴ�
    end
end 

%����gifͼ������
% filename='mao_pao2.gif';  %����gif���ļ���
% for ii=1:len_fig
%     [I_map,map] =rgb2ind(img{ii}, 256);
%     if ii ==1
%         imwrite(I_map, map,filename,'gif','Loopcount',inf,'DelayTime',0.05)
%     else
%         imwrite(I_map, map,filename,'gif','WriteMode','append','DelayTime',0.05)
%     end
% end