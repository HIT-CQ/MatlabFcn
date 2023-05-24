function qL = quaternLeft(q)
% Input:     四元数q
% Output:  四元数q的左乘矩阵

qw = q(1);
qv = [q(2);q(3);q(4)];

qL = qw*eye(4) + [0  -qv.'; qv  VecToso3(qv)];
end