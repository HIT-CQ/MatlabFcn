function euler = rotMat2euler(R)
% ��ת����R  ��   ZYX�� Euler��
%
%  Input:   ��ת����R
% Output:  ZYX-Euler�ǣ�phi��Χ��X��ת�ǣ�theta��Χ��Y��ת�ǣ�psi��Χ��Z��ת��)

    phi = atan2(R(3,2,:), R(3,3,:) );
    theta = -atan(R(3,1,:) ./ sqrt(1-R(3,1,:).^2) );
    psi = atan2(R(2,1,:), R(1,1,:) );

    euler = [phi(1,:)' theta(1,:)' psi(1,:)'];
end

