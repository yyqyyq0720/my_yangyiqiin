% �������򣬷ǵݹ鷽������
function [mylist_1,L]=my_quick_sort2(mylist_1,my_L,my_R)

% list_1 =[randperm(12)��2��3��0];  ��������
% N=length(list_1);

% �ݹ鷵����������С�߽�
if my_L>=my_R
    return
end


%%%%�����ⲻ������ʱ�临�Ӷȣ���Ϊ����ѭ����ʱ�临�Ӷ���O(n)
%%%%�������㷨ʱ�临�Ӷ���O��nlogn��-O(n^2)
ki=1;
for ii=my_L:my_R-1
    if mylist_1(ii)>mylist_1(ii+1)
        ki=0;
         break
    end
end
if ki==1
    return
end

%��ʼ��
L=my_L;   %��������±꣬
R=my_R;   %�ұ������±�
tem = mylist_1(L);  %��׼��

%%%������������һ�׼����ȥ��λ��
while L<R
    %%%���������ұ�temС��ֵ����temС��ֹͣѭ��������L<R��
    %%%���ﲢ����Ҫ�Ա�tem���ֵ���в���
    while tem<=mylist_1(R) && L<R
        R = R-1;
    end
    if L<R
        mylist_1(L)=mylist_1(R); %��Сֵת�Ƶ���׼��tem���  
    end
    
    %%%���������ұ�tem���ֵ����temС��ֹͣ
    %%%���ﲢ����Ҫ�Ա�temС��ֵ���в���
    while tem>mylist_1(L) && L<R
       L=L+1;
    end
    if L<R
        mylist_1(R)=mylist_1(L); %����ֵת�Ƶ���׼��tem�ұ�
    end
end
   mylist_1(L)=tem;%����׼ֵ�ŵ���Ӧλ��






