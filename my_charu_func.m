%����������
%��Ҫ��Ϊ��ʹ��ϣ������
function [list_1,num_exchange]=my_charu_func(list_1,num_exchange)
% num_exchange���������������ֻ�������飬Ĭ��Ϊ0
if nargin==1
    num_exchange=0;
end
    
N=length(list_1);
for ii=2:N
    %�ӵڶ�Ԫ�ؿ�ʼ���ֱ�˳����ǰһλԪ�رȽ� 
    
    for k=(ii-1):-1:1 %�Ӻ���ǰ��(��ο�����while)
        %���С�ڣ��򽻻�λ��
        if list_1(k+1)<list_1(k)
            tem=list_1(k+1);
            list_1(k+1)=list_1(k);
            list_1(k)=tem;
            num_exchange= num_exchange+1;%���������λ�ã�+1��Ϊ�۲�ʱ�临�Ӷ�����
%         else
%             break   %������ڣ�˵��˳����ǡ���źõģ�û��Ҫ�����Ƚ���ȥ
        end
    end
end