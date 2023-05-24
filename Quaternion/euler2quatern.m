function q = euler2quatern(phi, theta, psi)
%  ZYX��Euler��    ��    ��Ԫ��

%  Input:      ZYX��Euler��
%                 phiΪ��X��ת��, thetaΪ��Y��ת�ǣ�psiΪ��Z��ת��
%  Output:  ��Ԫ��q

    cosPsi = cos(psi * 0.5);
    sinPsi = sin(psi * 0.5);

    cosTheta = cos(theta * 0.5);
    sinTheta = sin(theta * 0.5);

    cosPhi = cos(phi * 0.5);
    sinPhi = sin(phi * 0.5);

    q = [cosPsi * cosTheta * cosPhi + sinPsi * sinTheta * sinPhi;
         -(cosPsi * cosTheta * sinPhi - sinPsi * sinTheta * cosPhi);
         -(cosPsi * sinTheta * cosPhi + sinPsi * cosTheta * sinPhi);
         -(sinPsi * cosTheta * cosPhi - cosPsi * sinTheta * sinPhi)]; % must be conjugate
end

