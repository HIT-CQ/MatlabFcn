function q = axisAngle2quatern(axis, angle)
% 旋转轴-旋转角  →  四元数 q
%
%   Input:     旋转轴 axis   (3×1)
%                 旋转角 angle
%   Output:  四元数 q  (4×1)

    q0 = cos(angle/2);
    q1 = -axis(1)*sin(angle/2);
    q2 = -axis(2)*sin(angle/2);
    q3 = -axis(3)*sin(angle/2);
    q = [q0; q1; q2; q3];
end

