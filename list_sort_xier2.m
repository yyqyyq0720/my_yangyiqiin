%ϣ������2�������ú����汾
clear
list_1=randperm(40);

% x=-20:20;
x=linspace(0,2*pi,40); %��������
list_1=x(list_1);%��x�������,����ֵ��list_1
axis equal
% plot(cos(x),sin(list_1))
% title('����Բ');
%[0,2,-3,randperm(40),45,45,39]
N=length(list_1);
n = floor(N/2);
nn=0;  % ����λ�ô���
while n>0
    %ii �����ÿ������ĵ�һ����������
    for ii =1:n
        
        for jj=ii+n:n:N
            
            if list_1(jj)<list_1(jj-n)%���С��
                tem=list_1(jj);
                kk=jj-n; %Ҫ�Ƚ���һ��������
                while kk>=1 && list_1(kk)>tem
                    list_1(kk+n)=list_1(kk);
                    kk=kk-n;
                    nn=nn+1;
                end      
                list_1(kk+n)=tem;
                
                 drawnow
                 pause(.1)
                 subplot(2,1,1);
                 
                 %                  plot(x,list_1)
                 bar(list_1)
                 subplot(2,1,2);
                 
                 plot(cos(x),sin(list_1));
                 title('����Բ');
                 %                 subplot(2,1,1);
                 %                 plot(x,list_1);
                 %                 subplot(2,1,2)
                 %                 bar(list_1)
            end
        end
    end
    n=floor(n/2);
end
% list_1