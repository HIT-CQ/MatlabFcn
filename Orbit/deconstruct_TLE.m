function Sat = deconstruct_TLE(TLEFile)
  % 函数:解构TLE

  % 加载TLE的文本文件
  data   = importdata(TLEFile);
  
  % 加载常数
  constants

  % 初始化
  Sat.e           = str2double(['0.' data.textdata{2,5}]);
  Sat.i           = str2double(data.textdata{2,3});
  Sat.rascension  = str2double(data.textdata{2,4});
  Sat.AoP         = str2double(data.textdata{2,6});
  Sat.meanAnomaly = str2double(data.textdata{2,7});
  Sat.EpochYear   = str2double(data.textdata{1,4}(1:2));
  Sat.EpochDay    = str2double(data.textdata{1,4}(3:end));

  % 计算轨道周期以获得 a
  meanMotion    = data.data(2,1);           % Revs/day
  orbitalPeriod = secs_per_day/meanMotion;   % s

  % 计算 a
  Sat.a = ((mu_earth*orbitalPeriod^2)/(4*pi^2))^(1/3);

  % 返回轨道周期
  Sat.orbitPeriod = orbitalPeriod;

end


