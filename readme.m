disp('多维多类特征提取LDA');
disp('本程序依赖libSDR_XXXX(四个)函数，遗失不补~');
disp('y为标签向量，暂时只支持数字');
disp('x为数据矩阵，不论纵横，只要和y对齐即可，本lib会自己翻转来着~');
disp('例如y是行向量，那么每一个x向量都是列向量。');
disp(' ');
disp('函数定义W = libSDR_LDA(label_y,data_x,varargin)')
disp('varargin = dim,beta,Method，这三项均为选填');
disp('dim是分解出的W中的w的数量，各个w之间是正交的，w的范数都是1。');
disp('beta是辅助矩阵的参数ξ');
disp('Method是多类多维时的方法参数，是先单类Fisher以后再做特征值提取还是直接特征值提取（默认）');
disp(' ');
disp('本程序有小工具：libSDR_TryClassification( y,x,test_ratio,isrand )')
disp('作用为：尝试使用Fisher查看多类的数据，自动区分测试集和数据集');
disp('isrand参数表示是否要在开始前随机打乱数据');
disp('test_ratio代表测试集占全集的比重')
disp('y为标签向量，纯数字，不一定从1开始，可任意。')
disp('x是行向量组，每一个行向量就是一个数据')
disp(' ');
disp('本程序另有小工具：libSDR_ViewData( train_y,train_x,varargin )')
disp('可在三维空间内查看降维的有标签高维数据')
disp('varargin处可选择填写测试集的y和x');
disp(' ');
disp('详细用法请看三个单元测试');
disp(' (*_*)oOO ');
