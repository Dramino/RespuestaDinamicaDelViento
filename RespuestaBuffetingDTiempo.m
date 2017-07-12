% TIME DOMAIN SIMULATIONS OF BUFFETING RESPONSE
clear all
close all
Datos
% Fill in for sigma_r :
sigma_r = [0.139 0.076];
% Choose integration accuracy :
omega = linspace (0 ,20 ,2000) ;
div = 4;
N_omega = length ( omega );
domega = ( omega ( N_omega ) - omega (1) ) / N_omega ;
% Simulate over 10 minutes ' periodes :
t = linspace (0 ,600 ,600) ;
n_t = length (t) ;
% Define variables :
S_r_dphi = zeros ( n_mod , N_omega );
S_r = zeros ( n_mod , N_omega );
r = zeros ( n_mod , n_t );
% Response at the tip of the cantilever :
for i = 1: n_mod
	Int =0;
	S_r_dphi (i ,:) = ResponseSpectrum( omega , div , rho , zeta_e ,V ,B ,D , Cd ,Cl , Cdl , L_el ,c_nx , A_n , xL_n , I_n ,i , Phi (i ,:) , omega_e (i) , m_e (i ) , IntPhi_e (i)) ;
	S_r (i ,:) = S_r_dphi (i ,:) * Phi (i ,1) ^2;
    for j = 1: N_omega
	r(i,:) = r(i,:) + sqrt (2* S_r(i,j)* domega ) .* cos ( omega(j)*t - rand (1) *2* pi);
	Int = Int + S_r(i,j);
    end
	% Peak factor :
	maxv = max ( abs (r(i ,:) ) );
	kp = maxv / sigma_r ( i)
end
% Plot the response of time :
subplot (2 ,1 ,1)
plot (t , r (1 ,:) )
grid
xlabel ( 'T [s] ')
ylabel ( ' r_y [m] ')
hold all
subplot (2 ,1 ,2)
plot (t , r (2 ,:) )
grid
xlabel ( 'T [s] ')
ylabel ( ' r_z [m] ')