%ϣ�������ֳ���С���������ǶԲ����㷨�ĸĽ�
%���ò�������ѡ�����汾
%1.����,��� floor(N/2 )����Ϊһ��
clear
list_1=[randperm(20),randperm(20)-21,2,2,20,20];
% [randperm(23),0,-5,4,4,4��30]     ��������
N=length(list_1);
n=floor(N/2);

num_exchange=0;%��������

% stem(list_1)
while n>0
    kk =1;% k=1Ϊÿ������һ�������±�  
    while kk<=n
        %���ò���������
    [list_1(kk:n:N),num_exchange]=my_charu_func(list_1(kk:n:N),num_exchange);
    kk=kk+1;
    end
    
    n=floor(n/2);
    drawnow
   pause(.3)
    stem(list_1)
end
