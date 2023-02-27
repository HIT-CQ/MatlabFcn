% 测试代码
clear; clc;
% 解构TLE数据
satTLE = deconstruct_TLE('TLE.txt');

%% 给定时间序列t,求解时刻t时的位置及速度
% 航天器的位置在ECI系下
% 航天器的速度在轨道坐标系下
% 可假设航天器体系与轨道系重合

t=1:2000;

[ECIPos,OrbitVel] = OrbitSimulate(satTLE,t);

plot3(ECIPos(1,:),ECIPos(2,:),ECIPos(3,:))


% %% 给定时刻t,求解时刻t时的位置及速度
% 
% t=2000;
% 
% [ECIPos,OrbitVel] = OrbitSimulate(satTLE,t);