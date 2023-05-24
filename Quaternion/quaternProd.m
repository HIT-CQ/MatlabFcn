function pq = quaternProd(p, q)
% Input:     四元数p   四元数q
% Output:  四元数乘法结果pq

pw = p(1);       pv = [p(2);p(3);p(4)];                    
qw = q(1);       qv = [q(2);q(3);q(4)];

pq = [pw*qw-pv.'*qv;  
          pw*qv+qw*pv+VecToso3(pv)*qv];
end

