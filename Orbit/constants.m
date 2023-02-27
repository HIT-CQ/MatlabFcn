%% �����������ĳ���ֵ
%
%  --ע��--
%  �˽ű��������ڴ�ģ�����漰�����нű��������ͳ��������ȫ�ֳ�����
%  ��Щֵ��Զ�����������ط��޸ģ���˶���Щ��������������ÿ�ζ��᷵�������ﶨ���ֵ��ͬ��ֵ��


%% ��������
% ����ƫ���� (unitless)
global e_earth;
e_earth =  0.08181919;

% J2�㶯����
global J2;
J2 = 0.00108262668;

% ������ת��
global w_earth;
w_earth = 7.292115e-5;

% ÿ�������
global secs_per_day;
secs_per_day = 24 * 60 * 60;

% ÿ���ӵ�����
global secs_per_min;
secs_per_min = 60;

% ÿת�Ļ���
global rads_per_rev;
rads_per_rev = 2 * pi;

%% �� km Ϊ��λ�İ汾
% ������������ mu = GM for the Earth (km^3/s^2)
global mu_earth;
mu_earth = 398600.4418;

% ����뾶 (km)
global r_earth;
r_earth = 6378.137;

% J2�㶯ģ���г��ֵĳ���
global mu_J2_r_sq;
mu_J2_r_sq = mu_earth * J2 * r_earth^2;


% %% �� m Ϊ��λ�İ汾
% % ������������ mu = GM for the Earth (m^3/s^2)
% global mu_earth;
% mu_earth = 398600.4418e9;
% 
% % ����뾶 (m)
% global r_earth;
% r_earth = 6378137;
% 
% % J2�㶯ģ���г��ֵĳ���
% global mu_J2_r_sq;
% mu_J2_r_sq = mu_earth * J2 * r_earth^2;