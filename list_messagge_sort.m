%��ƴ,��ƴ��������
function list_new = list_messagge_sort(my_list,my_list_1)
%�жϣ�ֻ����һ������ ��������������Ĳ����ǲ�ͬ��
switch nargin
    case 1
        N=length(my_list);
        N_half =round(N/2);
        
        my_list_2=my_list(1:N_half);
        my_list_3=my_list(N_half+1:end);
        n1 = length(my_list_2);  %�������еĳ���
        n2 = length(my_list_3);
    case 2
        my_list_2=my_list;
        my_list_3=my_list_1;
        n1 = length(my_list_2);  %�������еĳ���
        n2 = length(my_list_3);   
end

N=n1+n2;
%���ֻ����һ�����飬�Ҹ������������һ��Ԫ�أ�����Ҫ����
if N<2
    list_new=my_list_2;
    return
end

list_new=zeros(1,N); %Ԥ����ռ䣬�Ż�����

na=1; %list_2��������ֵ
nb=1; %list_3��������ֵ������˵���±�

%������򣬵����к�ƴ
for k=1:N   %������ʵ��whileҲ�У�ֻҪע������ѭ������
    
    %�����жϣ��������һ�������Ԫ���Ѿ�ȫ�����������У�ֻ����һ������
    if na>n1
        list_new(k)=my_list_3(nb);
        nb=nb+1;
        continue
    end
    %ͬ��
    if nb>n2
        list_new(k)=my_list_2(na);
        na=na+1;
        continue
    end
    %%%%%
    if my_list_2(na)<my_list_3(nb)
        list_new(k)=my_list_2(na);   %����Сֵд��list_new��
        na =na+1;
    else 
        list_new(k)=my_list_3(nb);
        nb=nb+1;
    end 
end



