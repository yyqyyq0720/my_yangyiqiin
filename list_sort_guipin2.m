%��ƴ���� ���ú�ƴ����
%��������õ�����ʽ��Ҳ�����õݹ鷽��
%��ƴ��  list_messagge_sort.m��������
clear ��close all

list_1=[randperm(30),randperm(20)-20]; %���У�����˵���飩
N = length(list_1);                    %���г���

bin_list_length=dec2bin(N);     %��Nʵ��ʮ�����������ת�����д���

tem_len=2;       %��һ�ֵ�����ʹ��
n= floor(N/2);   %��Сȡ������ 1.9���� 1��  -3.3���� -4����������������

bar(list_1);     %��ԭʼ����ͼ�����������Կ��Ժ��ԣ�����Ѱ���ӻ�������
% pause             %��ͣ���۲�ԭʼ����ͼ�񣬰��ո������


%��������
%��һ�֣�����2��ĳ�η��йص���������
while n>0
    for k=1:n
        left_pt=(k-1)*tem_len+1;
        right_pt= k*tem_len;
        
        tem_list=list_messagge_sort(list_1(left_pt:right_pt));
        list_1(left_pt:right_pt)=tem_list;   %������Լ򻯣�tem_list�Ǳ�Ҫ
    end
    n= floor(n/2);   
    tem_len=tem_len*2;  
    
    %��ͼ
    drawnow
    pause(.4)  %��ͣ0.4�룬��Ȼͼ��仯̫��
    bar(list_1)
end
%��һ�ֵĽ����N�Ķ�����������أ��������ĳ���Ϊ2��n�η���
%��ô�ڶ�����ʵ�����ˣ����ǱȽϷ���2��n�η����ȵ�����Ͼ���������Ҫ����������


nn = length(bin_list_length); %nnΪN�Ķ��������ֵĳ��ȣ����ڵ���
tem_n=nn-1;     %���������ֵĳ��ȼ�һ�����ڵ����У��������ݵ����������
L =2^tem_n;     %ͬ�ϣ���ʼΪ���У����飩�е�һ���������еĳ��ȣ�Ҳ����ʱ����
%  �ڶ��֣�����
for ii=2:nn
    
   % ��������ĳ2��n�η��ķ�������Ϊ�գ�����
    if bin_list_length(ii)=='0'
        tem_n=tem_n-1;
        continue
    end
    if bin_list_length(ii)=='1'
        tem_n=tem_n-1;
        
        L2=2^tem_n;
        
        tem_list=list_messagge_sort(list_1(1:L), list_1(L+1:L+L2));
        list_1(1:L+L2)=tem_list;    %ͬ������Ҳ���Լ�

        L=L+2^tem_n;
    end
    %������ͼ
    drawnow
     pause(.4) %��ͣ0.4�룬��Ȼͼ��仯̫�죬�����壬��������ʱ���Բ�Ҫ
    bar(list_1)
end

% list_1




