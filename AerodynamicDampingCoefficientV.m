function [ zeta_ae ] = AerodynamicDampingCoefficientV (B ,D , rho , a_z , K_az , m_e , sigma_r ,IntPhi_e , IntPhi_Lexp )
	zeta_ae = (( rho *B ^2* K_az ) /(4* m_e ) ) .*(1 -( sigma_r ./( a_z *D)) .^2) *( IntPhi_e /IntPhi_Lexp );
end