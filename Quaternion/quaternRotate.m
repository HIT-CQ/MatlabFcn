function v = quaternRotate(v, q)
% ͨ��һ����Ԫ��qת��һ������v
%
% Input:    ����v   ��Ԫ��q
% Output: ��ת�������v

    v0XYZ = quaternProd(quaternProd(q, [0; v]), quaternConj(q));
    v = v0XYZ(2:4);
end

