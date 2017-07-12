function sigma_r = StandardDeviation (omega,div,rho,zeta_e,V,B,D,Cd,Cl,Cdl,L_el,c_nx,A_n,xL_n,I_n,dir,Phi,omega_e,m_e,IntPhi_e)
	% Calculates standard deviation of response along x - axis for mode Phi
	Nomega = length ( omega );
	domega = ( omega ( Nomega ) - omega (1) ) /( Nomega -1) ;
	Int = 0;
	% Frequency response function :
	abs_H = FrequencyResponse(omega,rho,zeta_e,V,B,D,Cd,Cdl,L_el,dir,Phi,omega_e,m_e,IntPhi_e);
	% Normalized joint acceptance function :
	Jnorm = JointAcceptance (omega,div,V,B,D,Cd,Cl,Cdl,L_el,c_nx,A_n,xL_n,I_n,dir,Phi,IntPhi_e);
	% Integration :
	for i = 1: Nomega
		Int = Int + abs_H (i ) ^2* Jnorm ( i);
	end
	% Standard deviation of the response :
	sigma_r = abs ( Phi ) * (( rho *V ^2* B) /(2* m_e * omega_e ^2) * sqrt ( Int * domega )) ;
end