%%%%�������򣬵��ú���
%my_quick_sort
clear
% global quick_list_1
list_1=[44,randperm(43),45];
%��������

L=1;
R=length(list_1);
cells_ls=list_1;
[list_1,cells_ls]=my_quick_sort(list_1,L,R,cells_ls);
stem(cells_ls(1,:));
pause(2)%��ͣ2��
[ii,kk]=size(cells_ls);
for ni=2:ii
    drawnow
    pause(.05)
    stem(cells_ls(ni,:));
end