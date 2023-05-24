function euler = rotMat2euler(R)
% 旋转矩阵R  →   ZYX型 Euler角
%
%  Input:   旋转矩阵R
% Output:  ZYX-Euler角（phi是围绕X的转角，theta是围绕Y的转角，psi是围绕Z的转角)

    phi = atan2(R(3,2,:), R(3,3,:) );
    theta = -atan(R(3,1,:) ./ sqrt(1-R(3,1,:).^2) );
    psi = atan2(R(2,1,:), R(1,1,:) );

    euler = [phi(1,:)' theta(1,:)' psi(1,:)'];
end

