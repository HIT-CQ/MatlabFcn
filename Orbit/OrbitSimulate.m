function [ECIPos,orbitVel,orbitAcc,R,om] = OrbitSimulate(Satdata,t)
% orbitSimulate - 此函数的目的是计算轨道位置和速度(ECI系下)
%
% Input    ----> 航天器TLE两行数据 & 仿真时刻 (秒)
% Output ----> 航天器 位置(ECI Frame) & 速度(Orbit Frame) & 轨道加速度 & O2E的旋转矩阵R &
% 轨道角速度 om

% 加载常数
constants

% Find Mean Anomaly (平近点角)
n  = sqrt(mu_earth/Satdata.a^3);    % mean orbital rate (Mean Motion)
om = [0;n;0];
t0 = Satdata.EpochDay*secs_per_day; 

% 创建一个时间序列 or 时刻
t  = t0 + t;

% Calculate M (Radians)
M  = deg2rad(Satdata.meanAnomaly) + n*(t-t0);

% Find E
E  = findE(M,Satdata.e);

% Find true anomaly (真近点角theta)
A     = sqrt((1+Satdata.e)./(1- Satdata.e)).*tan(E./2);
theta = 2*atan2(A,1); 

% Find distance
p = Satdata.a*(1 - Satdata.e^2);
r = p./(1 + Satdata.e.*cos(theta));

% Find Position & Velocity
orbitPos    = findPos(r,theta);
orbitVel    = findVel(p,Satdata.e,theta);
orbitAcc    = - mu_earth*orbitPos/((norm(orbitPos))^3);

% Convert satellite coordinates from Orbit to ECI frame
[R,ECIPos]      = orbit2ECI(orbitPos,Satdata);

end

