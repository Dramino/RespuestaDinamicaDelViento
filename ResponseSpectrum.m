function S_r_dphi = ResponseSpectrum ( omega , div , rho , zeta_e ,V ,B ,D , Cd ,Cl , Cdl , L_el ,c_nx , A_n , xL_n , I_n ,dir , Phi , omega_e , m_e , IntPhi_e )
	% Calculates response spectrum divided on Phi ( x_r )
	% Frequency response function :
	abs_H = FrequencyResponse ( omega , rho , zeta_e ,V ,B ,D ,Cd , Cdl , L_el , dir , Phi , omega_e ,m_e , IntPhi_e );
	% Normalized joint acceptance function :
	Jnorm = JointAcceptance ( omega , div ,V ,B ,D ,Cd ,Cl , Cdl , L_el , c_nx , A_n , xL_n , I_n , dir ,Phi , IntPhi_e );
	% Response spectrum :
	S_r_dphi = (( rho *V ^2* B) /(2* m_e * omega_e ^2) ) ^2 * abs_H .^2.* Jnorm ;
end