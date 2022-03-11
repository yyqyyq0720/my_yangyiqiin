%希尔排序2，不调用函数版本
clear
list_1=randperm(40);

% x=-20:20;
x=linspace(0,2*pi,40); %画点好玩的
list_1=x(list_1);%将x随机排列,并赋值给list_1
axis equal
% plot(cos(x),sin(list_1))
% title('画个圆');
%[0,2,-3,randperm(40),45,45,39]
N=length(list_1);
n = floor(N/2);
nn=0;  % 交换位置次数
while n>0
    %ii 分组后每组数组的第一个数的坐标
    for ii =1:n
        
        for jj=ii+n:n:N
            
            if list_1(jj)<list_1(jj-n)%如果小于
                tem=list_1(jj);
                kk=jj-n; %要比较下一个数坐标
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
                 title('画个圆');
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