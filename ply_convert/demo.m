clear;
clc;
clf;
load earth;
[x,y,z]=sphere(30);
h=surface(x,y,z);
set(h,'CData',X,'FaceColor','texturemap');%texturemap������ͼ
colormap(map);
axis equal;
set(gca,'CameraViewAngleMode','manual');
view(3);