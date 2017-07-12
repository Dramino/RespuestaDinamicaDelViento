function [ abs_H ] = FrequencyResponse ( omega , rho , zeta_e ,V ,B ,D ,Cd , Cdl , L_el , dir , Phi ,omega_e , m_e , IntPhi_e )
	% Returns the frequency response for mode Phi
	% dir = 1 --> y - direction
	% dir = 2 --> z - direction
	zeta_ae = AerodynamicDampingCoefficient ( rho ,V ,B ,D ,Cd , Cdl , Phi , omega_e , m_e , L_el ,dir , IntPhi_e );
	abs_H = abs (1 - ( omega ./ omega_e ) .^2 + 2*1i *(zeta_e - zeta_ae) *(( omega ./ omega_e ))) .^( -1) ;
end