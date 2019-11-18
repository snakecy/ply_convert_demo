function [vout, cout] = ReadSTLACSII(filename)


fid=fopen(filename, 'r');
if fid == -1 
    error('�ļ��򿪴���.')
end


%��ȡ�ļ�ͷ��STL�ļ���һ�����ļ���
File_name = sscanf(fgetl(fid), '%*s %s') %��ȡ�ļ�������


%�������
vnum=0;       %�������.
report_num=0; %���浱ǰ״̬
STLvcolor = 0; %��ķ�����
STLxyz=0;      %ÿ����Ķ�������
i=1;         %��¼������Ƭ��ĸ���


%��ʼ�������ļ���ֱ��������Ϊֹ
while feof(fid) == 0                    %����ļ��Ƿ����
    tline = fgetl(fid);     % ��ȡ�ļ��е�����������
    fword = sscanf(tline, '%s')    % ������ת��Ϊ�ַ���
  



if strncmpi(fword, 'facetnormal',11) == 1;    % ����Ƿ�Ϊ������
       STLvcolor= sscanf(tline, '%*s %*s %lf %lf %lf')  % ��¼��������
       c(:,i) = STLvcolor
       i=i+1
end                                            

%�������
if strncmpi(fword, 'vertex',6) == 1;    % ����Ƿ��Ƕ�������
    STLxyz= sscanf(tline, '%*s %lf %lf %lf')  %��¼��������
       vnum = vnum + 1;    
end


%��������Ƿ�����
if  vnum~=report_num
     report_num=vnum
       v(:,vnum)=STLxyz                   
end
                                                             
end
%�ر��ļ�
fclose(fid); 
vout = v' 
cout = c'




end