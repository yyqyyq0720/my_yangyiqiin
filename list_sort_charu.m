
%插入排序，时间复杂度O(n2)
% 把待排序的数组分成已排序和未排序两部分，初始的时候把第一个元素认为是已排好序的。
% 从第二个元素开始，在已排好序的子数组中寻找到该元素合适的位置并插入该位置。
% 重复上述过程直到最后一个元素被插入有序子数组中。
%本代码实现的是从小到大排列
clear,close all

list_1 =[randperm(25),randperm(25)-26];
N=length(list_1);
num_exchange=0;  %交换位置次数

%画图使用到的变量初始化
len_fig=1;
hf=figure;
bar(list_1,'r');
now_fra=getframe(hf);
now_fdata{len_fig}=frame2im(now_fra);

%主体程序
for ii=2:N
    
    %从前往后，第二元素开始，分别按顺序与前一位元素比较 
    for k=(ii-1):-1:1
        %如果小于，则交换位置
        if list_1(k+1)<list_1(k)
            tem=list_1(k+1);
            list_1(k+1)=list_1(k);
            list_1(k)=tem;
             num_exchange=num_exchange+1; %如果交换了位置，+1，为观察时间复杂度设置
            
        else
            %如果大于或等于，说明顺序是恰好排好的，没必要继续比较下去，
            break   
        end
        drawnow;
        bar(list_1,'r');
        %保存画图数据
        len_fig=len_fig+1;
        now_fra=getframe(hf);
        now_fdata{len_fig}=frame2im(now_fra);
    end
end

filename='charu_2.gif';
for ii=1:len_fig
    [Imap, map] = rgb2ind(now_fdata{ii},256);
   if ii==1
       imwrite(Imap,map,filename,'gif','Loopcount',inf,'DelayTime',0.05);
   else
       imwrite(Imap,map,filename,'gif','WriteMode','append','DelayTime',0.05); 
   end
       
    
end







