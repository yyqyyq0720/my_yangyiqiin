
%��������ʱ�临�Ӷ�O(n2)
% �Ѵ����������ֳ��������δ���������֣���ʼ��ʱ��ѵ�һ��Ԫ����Ϊ�����ź���ġ�
% �ӵڶ���Ԫ�ؿ�ʼ�������ź������������Ѱ�ҵ���Ԫ�غ��ʵ�λ�ò������λ�á�
% �ظ���������ֱ�����һ��Ԫ�ر����������������С�
%������ʵ�ֵ��Ǵ�С��������
clear,close all

list_1 =[randperm(25),randperm(25)-26];
N=length(list_1);
num_exchange=0;  %����λ�ô���

%��ͼʹ�õ��ı�����ʼ��
len_fig=1;
hf=figure;
bar(list_1,'r');
now_fra=getframe(hf);
now_fdata{len_fig}=frame2im(now_fra);

%�������
for ii=2:N
    
    %��ǰ���󣬵ڶ�Ԫ�ؿ�ʼ���ֱ�˳����ǰһλԪ�رȽ� 
    for k=(ii-1):-1:1
        %���С�ڣ��򽻻�λ��
        if list_1(k+1)<list_1(k)
            tem=list_1(k+1);
            list_1(k+1)=list_1(k);
            list_1(k)=tem;
             num_exchange=num_exchange+1; %���������λ�ã�+1��Ϊ�۲�ʱ�临�Ӷ�����
            
        else
            %������ڻ���ڣ�˵��˳����ǡ���źõģ�û��Ҫ�����Ƚ���ȥ��
            break   
        end
        drawnow;
        bar(list_1,'r');
        %���滭ͼ����
        len_fig=len_fig+1;
        now_fra=getframe(hf);
        now_fdata{len_fig}=frame2im(now_fra);
    end
end

filename='charu_2.gif';
for ii=1:len_fig
    [Imap, map] = rgb2ind(now_fdata{ii},256);
   if ii==1
       imwrite(Imap,map,filename,'gif','Loopcount',inf,'DelayTime',0.05);
   else
       imwrite(Imap,map,filename,'gif','WriteMode','append','DelayTime',0.05); 
   end
       
    
end







