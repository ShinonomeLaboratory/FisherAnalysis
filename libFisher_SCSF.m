function [w] = libFisher_SCSF(label_y,data_x,beta)
%去看libFisher函数的说明
size_y=size(label_y);
size_x=size(data_x);
if size_y(1)==1
    size_y=size_y';
    data_x=data_x';
end
size_y=size(label_y);
size_x=size(data_x);

Sw=beta.*eye(size_x(2));

label_1=label_y(1);
lst_c1=find(label_y==label_1);
lst_c2=find(label_y~=label_1);

if length(lst_c1)<=2 || length(lst_c2)<=2
    disp('某一类的样本数量过少...');
end

m1=sum(data_x(lst_c1,:))./length(lst_c1);
m2=sum(data_x(lst_c2,:))./length(lst_c2);

C1=data_x(lst_c1,:);
C2=data_x(lst_c2,:);

D1=C1-repmat(m1,length(lst_c1),1);
D2=C2-repmat(m2,length(lst_c2),1);

Sw=Sw+D1'*D1;
Sw=Sw+D2'*D2;

w=Sw\(m2-m1)';
w=w./sqrt(sum(w.^2));
w=w(:);
end

