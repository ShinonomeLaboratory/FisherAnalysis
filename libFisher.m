function [W] = libFisher(label_y,data_x,varargin)
%多维多类特征提取Fisher
%本程序依赖libFisher_XXXX(四个)
%y为标签向量，暂时只支持数字
%x为数据矩阵，不论纵横，只要和y对齐即可，本lib会自己翻转来着~
%例如y是行向量，那么每一个x向量都是列向量。
%varargin=[dim,beta,Method]
%dim是分解出的W中的w的数量，各个w之间是正交的，w的范数都是1。
%beta是辅助矩阵的参数ξ
%Method是多类多维时的方法参数，是先单类Fisher以后再做特征值提取还是直接特征值提取（默认）
if nargin > 5
    ReadMe
    error('参数太多了啦 ~，~ ')
elseif nargin == 5 
    dim=round(varargin{1});
    beta=varargin{2};
    Method=varargin{3};%0-EP 1-PP
elseif nargin == 4 
    dim=round(varargin{1});
    beta=varargin{2};
    Method=0;
elseif nargin == 3
    dim=round(varargin{1});
    beta=1;
    Method=0;
else
    dim=1;
    beta=1;
    Method=0;
end
classes=length(unique(label_y));
if classes<2
    error('只有一类让伦家怎么分嘛 ~，~ ');
elseif classes==2
    if dim==1
        W=libFisher_SCSF(label_y,data_x,beta);
    elseif dim>1
        W=libFisher_SCMF(label_y,data_x,dim,beta);
    else
        error('特征数可要大于1哟~');
    end
else
    if Method==0
        W=libFisher_MCEP(label_y,data_x,dim,beta);
    elseif Method==1
        W=libFisher_MCPP(label_y,data_x,dim,beta);
    else
        ReadMe
        error('方法只能选择EP(0,默认)和PP(1)哟~');
    end
end
end
