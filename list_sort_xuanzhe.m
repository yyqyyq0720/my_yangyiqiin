%ѡ������ʱ�临�Ӷ�O(n2)
% ������һ�����У�a[0],a[1],a[2]...a[n]���ڣ������������������ȴ�0���λ��
% ��n���λ���ҳ���Сֵ��Ȼ�������Сֵ��a[0]������Ȼ���أ�a[1]��a[n]������
% �ǽ�����Ҫ���������
% 
% ���ǿ��Դ�1���λ�õ�n���λ���ҳ���Сֵ��Ȼ�������Сֵ��a[1]������
% ֮��a[2]��a[n]�������ǽ�����Ҫ���������
% 
% ÿһ�Σ����Ƕ����������ҳ�һ����Сֵ��Ȼ����������еĵ�һ��Ԫ�ؽ���λ�ã�
% ������ȥ���������Ԫ�ؾͻ�Խ��Խ�٣�ֱ�����һ��

clear,close all
list_1 =[5,5,5,5,randperm(51)-26,-5,-5,-5,-5];
N=length(list_1);

%ʹ�������ú��� min()���ܷ���
% for k =1:N-1    
%    [tem_min, tem_position]=min(list_1(k:end));
%     tem =list_1(k);
%     list_1(k) =tem_min;
%     list_1(tem_position+k-1)=tem;
%     
%     pause(.1)
%     stem(list_1)   
% end
hf=figure;
len_hf=1;
bar(list_1);
now_hf=getframe(hf);
data_hf{len_hf}=frame2im(now_hf);

tm='������Сֵ';
tem_posit=0;  %��ʼ��Сֵ���±꣬��Ȼ0�±���matlab��û�е�
for ii=1:N-1
    
    t=0; %����һ���ж�����
    %�ҳ���Сֵ����λ��,�൱�� min()����
    my_min=list_1(ii);%��ĳһ�ֵĵ�һ����Ϊ��Сֵ
    for k=ii:N-1
        if my_min>list_1(k+1)
            my_min = list_1(k+1); %�µ���Сֵ
            tem_posit =k+1;       %��Сֵλ��
            t=1;   %�����Сֵ���£�����Ϊ1
        end
    end
    %����λ��,ֻ��t=1ʱ��ſ��Խ�����t=0,˵��list_1(ii)ǡ�����ʵ���λ��
    if t==1
        tem = list_1(ii);
        list_1(ii) = my_min;
        list_1(tem_posit)=tem;
    end
    
    len_hf=len_hf+1;
    if mod(len_hf,2)==0
        color_hf='w';
    else
        color_hf='k';
    end
    drawnow
    pause(.3)%��ͣ0.3�� ,ʹ�� drawnow�����Ч���ã�����Ҳ��
    bar(list_1,color_hf)
    my_title=strcat(tm,num2str(my_min));
    title(my_title);
    
    now_hf = getframe(hf);
    data_hf{len_hf} = frame2im(now_hf);
end

filename='choice_sort3.gif';
for ii=1:len_hf
    [I_map,map] =rgb2ind(data_hf{ii}, 256);
    if ii ==1
        imwrite(I_map, map,filename,'gif','Loopcount',inf,'DelayTime',0.5)
    else
        imwrite(I_map, map,filename,'gif','WriteMode','append','DelayTime',0.5)
    end
end









