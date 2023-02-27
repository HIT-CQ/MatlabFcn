function Sat = deconstruct_TLE(TLEFile)
  % ����:�⹹TLE

  % ����TLE���ı��ļ�
  data   = importdata(TLEFile);
  
  % ���س���
  constants

  % ��ʼ��
  Sat.e           = str2double(['0.' data.textdata{2,5}]);
  Sat.i           = str2double(data.textdata{2,3});
  Sat.rascension  = str2double(data.textdata{2,4});
  Sat.AoP         = str2double(data.textdata{2,6});
  Sat.meanAnomaly = str2double(data.textdata{2,7});
  Sat.EpochYear   = str2double(data.textdata{1,4}(1:2));
  Sat.EpochDay    = str2double(data.textdata{1,4}(3:end));

  % �����������Ի�� a
  meanMotion    = data.data(2,1);           % Revs/day
  orbitalPeriod = secs_per_day/meanMotion;   % s

  % ���� a
  Sat.a = ((mu_earth*orbitalPeriod^2)/(4*pi^2))^(1/3);

  % ���ع������
  Sat.orbitPeriod = orbitalPeriod;

end


