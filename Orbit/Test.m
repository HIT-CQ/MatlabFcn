% ���Դ���
clear; clc;
% �⹹TLE����
satTLE = deconstruct_TLE('TLE.txt');

%% ����ʱ������t,���ʱ��tʱ��λ�ü��ٶ�
% ��������λ����ECIϵ��
% ���������ٶ��ڹ������ϵ��
% �ɼ��躽������ϵ����ϵ�غ�

t=1:2000;

[ECIPos,OrbitVel] = OrbitSimulate(satTLE,t);

plot3(ECIPos(1,:),ECIPos(2,:),ECIPos(3,:))


% %% ����ʱ��t,���ʱ��tʱ��λ�ü��ٶ�
% 
% t=2000;
% 
% [ECIPos,OrbitVel] = OrbitSimulate(satTLE,t);