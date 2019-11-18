function [vout, cout] = ReadSTLACSII(filename)


fid=fopen(filename, 'r');
if fid == -1 
    error('文件打开错误！.')
end


%读取文件头，STL文件第一行是文件名
File_name = sscanf(fgetl(fid), '%*s %s') %读取文件的名字


%定义变量
vnum=0;       %定点个数.
report_num=0; %报告当前状态
STLvcolor = 0; %面的法向量
STLxyz=0;      %每个面的定点坐标
i=1;         %记录三角形片面的个数


%开始读整个文件，直到结束符为止
while feof(fid) == 0                    %检查文件是否结束
    tline = fgetl(fid);     % 读取文件中的以银行数据
    fword = sscanf(tline, '%s')    % 将数据转化为字符串
  



if strncmpi(fword, 'facetnormal',11) == 1;    % 检查是否为法向量
       STLvcolor= sscanf(tline, '%*s %*s %lf %lf %lf')  % 记录向量坐标
       c(:,i) = STLvcolor
       i=i+1
end                                            

%检查坐标
if strncmpi(fword, 'vertex',6) == 1;    % 检查是否是顶点坐标
    STLxyz= sscanf(tline, '%*s %lf %lf %lf')  %记录顶点坐标
       vnum = vnum + 1;    
end


%检查坐标是否增加
if  vnum~=report_num
     report_num=vnum
       v(:,vnum)=STLxyz                   
end
                                                             
end
%关闭文件
fclose(fid); 
vout = v' 
cout = c'




end