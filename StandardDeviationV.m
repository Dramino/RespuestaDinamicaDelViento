function sigma_r = StandardDeviationV ( rho ,B ,D ,St , sigma_qz , a_z , b_z , lambda_z , K_az ,zeta_e , omega_e , m_e , Phi , IntPhi_e , IntPhi_Lexp , V)
	% Resonant velocity :
	V_R = ( D* omega_e ) /(2* pi* St );
	% Temporary variables :
	zeta_hat = ((4* m_e * zeta_e ) /( rho *B ^2* K_az )) *( IntPhi_e / IntPhi_Lexp );
	beta_hat = Phi /(2^(5/2) * pi ^(7/4) ) * (( rho *D ^3* lambda_z ) /( m_e * b_z * K_az * IntPhi_e ) )^(1/2) * ( sigma_qz /( St ^2* a_z ) ) * (V / V_R ) ^(3/2) * exp ( -(1/2) *((1 -( V_R /V)) / b_z )^2) ;
	% Solves the fourth order polynomial :
	sigma_hat = ((1 - zeta_hat ) /2 + (((1 - zeta_hat ) /2) ^2 + beta_hat ^2) ^(1/2) ) ^(1/2) ;
	% Standard deviation of displacement :
	sigma_r = sigma_hat * a_z *D;
end