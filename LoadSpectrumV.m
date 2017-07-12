function S_Q = LoadSpectrumV ( omega , rho ,B ,D ,St , sigma_qz , b_z , lambda_z , IntPhi_Lexp ,V)
    omega_s = (2* pi* St *V)/D ;
	S_Q = 2* lambda_z * D * (((0.5* rho *V ^2* B* sigma_qz ) ^2) /( sqrt (pi)* omega_s * b_z )) * exp( -((1 - omega ./ omega_s ) ./ b_z ) .^2) .* IntPhi_Lexp ;
end