function qR = quaternRight(q)
% Input:     ��Ԫ��q
% Output:  ��Ԫ��q����˾���

qw = q(1);
qv = [q(2);q(3);q(4)];

qR = qw*eye(4) + [0  -qv.'; qv  -VecToso3(qv)];
end