% �������򣬺���
function [mylist_1,cells_list]=my_quick_sort(mylist_1,my_L,my_R,cells_list)

% list_1 =[randperm(12)��2��3��0];  ��������
% N=length(list_1);

% �ݹ鷵����������С�߽�
if my_L>=my_R
    return
end


% ki=1; % ki=1��ʾ˳���Ǻõ�
% for ii=my_L:my_R-1
% % for ii=1:my_R-1
%     if mylist_1(ii)>mylist_1(ii+1)
%         ki=0;
%          break
%     end
% end
% if ki==1
%     return
% end
% %%%%�ڶ����߽磬������ηǳ���Ҫ�����Ա����໥�ݹ飬���Դ�󽵵�����ʱ��
% %%%%�����ⲻ������ʱ�临�Ӷȣ���Ϊ����ѭ����ʱ�临�Ӷ���O(n)
% %%%%�������㷨ʱ�临�Ӷ���O��nlogn��-O(n^2)



%��ʼ��
L=my_L;   %��������±꣬
R=my_R;   %�ұ������±�
tem = mylist_1(L);  %��׼��

%%%������������һ�׼����ȥ��λ��
while L<R
    %%%���������ұ�temС��ֵ����temС��ֹͣѭ��������L<R��
    %%%���ﲢ����Ҫ�Ա�tem���ֵ���в���
    while  L<R && tem<mylist_1(R) 
        R = R-1;

    end
    if L<R
        mylist_1(L)=mylist_1(R); %��Сֵת�Ƶ���׼��tem��� 
    end
    
    %%%���������ұ�tem���ֵ����temС��ֹͣ
    %%%���ﲢ����Ҫ�Ա�temС��ֵ���в���
    while L<R && tem>=mylist_1(L)
       L=L+1;
    end
    if L<R
        mylist_1(R)=mylist_1(L); %����ֵת�Ƶ���׼��tem�ұ�
    end
end
  
   mylist_1(L)=tem;%����׼ֵ�ŵ���Ӧλ��
   
    cells_list=[cells_list;mylist_1];%%%���ֲ�������
    


%��������ȷ������matlab�����������ݹ��໥Ӱ�죬��������ʱ���ܸ���
%�ݹ��໥Ӱ��ᵼ�²��������ظ���������
%�����ȵݹ飿�����������벻����
[mylist_1,cells_list]=my_quick_sort(mylist_1,1,L-1,cells_list);
%��ݹ飬����������ظ��ݹ飬��ʲô�������������������������
[mylist_1,cells_list]=my_quick_sort(mylist_1,L+1,my_R,cells_list);

