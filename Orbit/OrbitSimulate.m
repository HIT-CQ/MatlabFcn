function [ECIPos,orbitVel,orbitAcc,R,om] = OrbitSimulate(Satdata,t)
% orbitSimulate - �˺�����Ŀ���Ǽ�����λ�ú��ٶ�(ECIϵ��)
%
% Input    ----> ������TLE�������� & ����ʱ�� (��)
% Output ----> ������ λ��(ECI Frame) & �ٶ�(Orbit Frame) & ������ٶ� & O2E����ת����R &
% ������ٶ� om

% ���س���
constants

% Find Mean Anomaly (ƽ�����)
n  = sqrt(mu_earth/Satdata.a^3);    % mean orbital rate (Mean Motion)
om = [0;n;0];
t0 = Satdata.EpochDay*secs_per_day; 

% ����һ��ʱ������ or ʱ��
t  = t0 + t;

% Calculate M (Radians)
M  = deg2rad(Satdata.meanAnomaly) + n*(t-t0);

% Find E
E  = findE(M,Satdata.e);

% Find true anomaly (������theta)
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

