function euler = quatern2euler(q)
%  Input:      四元数q
%  Output:   ZYX型Euler角
%                 phi为绕X的转角, theta为绕Y的转角，psi为绕Z的转角


    R(1,1,:) = 2.*q(1).^2-1+2.*q(2).^2;
    R(2,1,:) = 2.*(q(2).*q(3)-q(1).*q(4));
    R(3,1,:) = 2.*(q(2).*q(4)+q(1).*q(3));
    R(3,2,:) = 2.*(q(3).*q(4)-q(1).*q(2));
    R(3,3,:) = 2.*q(1).^2-1+2.*q(4).^2;

    phi = atan2(R(3,2,:), R(3,3,:) );
    theta = -atan(R(3,1,:) ./ sqrt(1-R(3,1,:).^2) );
    psi = atan2(R(2,1,:), R(1,1,:) );

    euler = [phi; theta; psi];
end

