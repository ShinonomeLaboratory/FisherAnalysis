function [W] = libFisher_SCMF(y,x,Wdim,beta)
%去看libFisher函数的说明
size_y=size(y);
size_x=size(x);
if size_y(1)==1
    size_y=size_y';
    data_x=data_x';
end
size_y=size(y);
size_x=size(x);
W=zeros(Wdim,size_x(2));
for j=1:Wdim
    w=libFisher_SCSF(y,x,beta);
    for i=1:length(y)
        %做正交化
        x(i,:)=x(i,:)-dot(x(i,:),w).*x(i,:);
    end
    W(j,:)=w(:)';
end
W=W';
end

