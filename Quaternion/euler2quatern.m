function q = euler2quatern(phi, theta, psi)
%  ZYX型Euler角    →    四元数

%  Input:      ZYX型Euler角
%                 phi为绕X的转角, theta为绕Y的转角，psi为绕Z的转角
%  Output:  四元数q

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

