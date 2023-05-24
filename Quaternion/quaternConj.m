function qConj = quaternConj(q)
% Input:     四元数q
% Output: 共轭四元数q*
    qConj = [q(1); -q(2); -q(3); -q(4)];
end
