function v = quaternRotate(v, q)
% 通过一个四元数q转动一个向量v
%
% Input:    向量v   四元数q
% Output: 旋转后的向量v

    v0XYZ = quaternProd(quaternProd(q, [0; v]), quaternConj(q));
    v = v0XYZ(2:4);
end

