%���������һ������һ�η�����ʵ�ֻ�׼�������С����
%�ұߵ������ڻ�׼�ģ�quick sort,
%����������ؼ�һ��
%���ã��ҳ���һ�����������е�λ�ã��±꣩
%�ο�����https://blog.csdn.net/morewindows/article/details/6684558(��л����)
% list_1=randperm(11)

clear
list_1 =[2,randperm(30),2]; %��������
N=length(list_1);
%��ʼ��
L=1;   %����������±꣬
R=N;   %�ұ������±�
tem = list_1(L);  %��׼��

%%%�������
while L<R
    %%%���������ұ�temС��ֵ����temС��ֹͣѭ��������L<R��
    %%%���ﲢ����Ҫ�Ա�tem���ֵ���в���
    while tem<list_1(R) && L<R
        R = R-1;
        
    end
    list_1(L)=list_1(R);  %��Сֵת�Ƶ���׼��tem���
    
    %%%���������ұ�tem���ֵ����temС��ֹͣ
    %%%���ﲢ����Ҫ�Ա�temС��ֵ���в���
    while tem>list_1(L) && L<R
       L=L+1;
    end
    list_1(R)=list_1(L); %����ֵת�Ƶ���׼��tem�ұ�
    
end
   L
   list_1(L)=tem;   %����׼ֵ�ŵ���Ӧλ��
   list_1

