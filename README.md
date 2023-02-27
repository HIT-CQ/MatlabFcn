# **"mr" MATLAB 代码库说明** #

 "mr" 文件夹为 几何力学中常用的MATLAB代码

其中大部分函数的数学形式均可在书籍《现代机器人学：机构、规划与控制》找到

英文版：《Modern Robotics: Mechanics, Planning, and Control》

此书的原版软件可在以下地址找到：

```
https://github.com/NxRLab/ModernRobotics
```

## 库的安装 ##

复制 "mr" 文件夹至计算机的某位置. 

## 库的导入 ##

```
addpath('$FOLDER_PATH/mr')
```

## 库的使用 ##

以函数 `RotInv` 为例，运行

```
help RotInv
```

测试该函数

```
R = [0, 0, 1; 1, 0, 0; 0, 1, 0];
invR = RotInv(R);
```

检查函数列表以及这些函数属于书中的哪一章，可使用 `help` 

```
help mr
```

# **"orbit" MATLAB 代码库说明** #

 "orbit" 文件夹为生成卫星轨道位置 速度的相关函数Matlab代码

具体功能：

通过人为给定的卫星TLE数据，生成卫星t时刻的位置和速度

可通过 "orbit" 文件夹中的`Test.m` 来测试

注：对于不同行星的轨道环境参数，可通过`constants.m`自主设定

# **"PlotFig" MATLAB 代码库说明** #

 "PlotFig" 文件夹为论文绘制美观学术图片的个人常用函数
