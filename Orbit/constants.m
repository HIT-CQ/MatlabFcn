%% 轨道仿真所需的常量值
%
%  --注释--
%  此脚本定义用于此模块中涉及的所有脚本、函数和程序的所有全局常量。
%  这些值永远不会在其他地方修改，因此对这些变量的所有引用每次都会返回与这里定义的值相同的值。


%% 其他常数
% 地球偏心率 (unitless)
global e_earth;
e_earth =  0.08181919;

% J2摄动常数
global J2;
J2 = 0.00108262668;

% 地球自转率
global w_earth;
w_earth = 7.292115e-5;

% 每天的秒数
global secs_per_day;
secs_per_day = 24 * 60 * 60;

% 每分钟的秒数
global secs_per_min;
secs_per_min = 60;

% 每转的弧度
global rads_per_rev;
rads_per_rev = 2 * pi;

%% 以 km 为单位的版本
% 地球引力常数 mu = GM for the Earth (km^3/s^2)
global mu_earth;
mu_earth = 398600.4418;

% 地球半径 (km)
global r_earth;
r_earth = 6378.137;

% J2摄动模型中出现的常数
global mu_J2_r_sq;
mu_J2_r_sq = mu_earth * J2 * r_earth^2;


% %% 以 m 为单位的版本
% % 地球引力常数 mu = GM for the Earth (m^3/s^2)
% global mu_earth;
% mu_earth = 398600.4418e9;
% 
% % 地球半径 (m)
% global r_earth;
% r_earth = 6378137;
% 
% % J2摄动模型中出现的常数
% global mu_J2_r_sq;
% mu_J2_r_sq = mu_earth * J2 * r_earth^2;