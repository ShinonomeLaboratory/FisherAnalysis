function [W] = libFisher_MCPP(label_y,data_x,Wdim,beta)
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

ClsID=unique(label_y);
ClsNum=length(ClsID);

for i=1:ClsNum
    flabel_y=label_y;
    flabel_y(find(label_y==ClsID(i)))=0;
    flabel_y(find(label_y~=ClsID(i)))=1;
    Wp(i,:)=libFisher_SCSF(flabel_y,data_x,beta);
end

data_x=data_x*Wp';

size_y=size(label_y);
size_x=size(data_x);

Sw=beta.*eye(size_x(2));

Sb=zeros(size_x(2));
m=sum(data_x)./length(data_x);



for k=1:ClsNum
	NowLable=ClsID(k);
	lst=find(label_y==NowLable);
	Nk=length(lst);
	if Nk<=2
		disp(['类别:',num2str(NowLable),'的样本太少！']);
	end
	Ck=data_x(lst,:);
	mk=sum(Ck)./Nk;
	Dk=Ck-repmat(mk,Nk,1);
	Sk=Dk'*Dk;
	Sw=Sw+Sk;
	Sb=Sb+Nk.*((mk-m)'*(mk-m));
end

D=Sw\Sb;
[EigVec,EigVal]=eig(D);
[~,I] = sort(diag(EigVal),'descend');EigVec = EigVec(:,I);
W = EigVec(:,1:Wdim)';
W = Wp'*W';
end
