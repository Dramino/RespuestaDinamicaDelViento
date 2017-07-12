% TIME DOMAIN SIMULATION OF VORTEX SHEDDING RESPONSE
clear all
close all
Datos
omega = linspace (0 ,20 ,2000) ;
N_omega = length ( omega );
domega = ( omega ( N_omega ) - omega (1) ) / N_omega ;
t = linspace (0 ,600 ,600) ;
n_t = length (t) ;
% Define the mode for which vortex shedding may be a problem :
Phii = Phi (2 ,1) ; % Largest displacement --> left tip of the cantilever
omega_e = omega_e (2) ;
m_e = m_e (2) ;
IntPhi_e = IntPhi_e (2) ;
% Fill in for sigma_r :
sigma_r = 0.130;
% Resonant velocity :
V = ( D_Vortex * omega_e ) /(2* pi* St );
% Aerodynamic damping coefficient :
zeta_ae = AerodynamicDampingCoefficientV (B , D_Vortex , rho , a_z , K_az , m_e , sigma_r ,IntPhi_e , IntPhi_Lexp );
% Frequency response function :
abs_H = abs (1 - ( omega ./ omega_e ) .^2 + 2*1i *( zeta_e - zeta_ae ) *(( omega ./ omega_e ))).^( -1) ;
% Load spectrum :
S_Q = LoadSpectrumV ( omega , rho ,B , D_Vortex , St , sigma_qz , b_z , lambda_z , IntPhi_Lexp ,V) ;
% Response spectrum :
S_r = (( Phii ^2* abs_H .^2) ./(( omega_e ^2* m_e * IntPhi_e ) .^2) ) .* S_Q ;
r = zeros (1 , n_t );
int =0;
% Response at the tip of the cantilever :
for i = 1: N_omega
	r = r + sqrt (2* S_r (i)* domega ) .* cos ( omega (i )*t - rand (1) *2* pi);
	int = int + S_r (i);
end
% Max value :
maxz = max ( abs (r) );
kpz = maxz / sigma_r
% Plot the response of time :
plot (t , r)
grid
xlabel ( 'T [s] ')
ylabel ( ' r_z [m] ')
