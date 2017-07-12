% PLOT STANDARD DEVIATION OF VORTEX SHEDDING RESPONSE
clear all
close all
Datos
omega_e = omega_e (2) ;
m_e = m_e (2) ;
IntPhi_e = IntPhi_e (2) ;
n = length ( L_el );
% Plots the standard deviation for different velocities :
V = linspace (0 ,20 ,10000) ;
n_V = length (V) ;
Phii = Phi (2 ,1) ; % Mode 2 evaluated in x = -98.7 m
sigma_r = zeros (1 , n_V );
for i = 1: n_V
	Vi = V(i );
	sigma_r (i) = StandardDeviationV ( rho ,B , D_Vortex , St , sigma_qz , a_z , b_z , lambda_z ,K_az , zeta_e , omega_e , m_e , Phii , IntPhi_e , IntPhi_Lexp , Vi );
end
subplot (2 ,1 ,1)
plot (V , sigma_r , 'Linewidth' ,2)
ylabel ( '\ sigma_ { r_ { z }}( x = -98.7) [m] ')
xlabel ( 'V [m/ s] ')
grid
axis ([0 20 0 0.15])
% Plots the standard deviation along the girder at resonant wind velocity :
V = ( D_Vortex * omega_e ) /(2* pi* St );
sigma_r = zeros (1 , n);
for i = 1: n
	Phii = Phi (2 , i );
	sigma_r (i) = StandardDeviationV ( rho ,B , D_Vortex , St , sigma_qz , a_z , b_z , lambda_z ,K_az , zeta_e , omega_e , m_e , Phii , IntPhi_e , IntPhi_Lexp , V);
end
subplot (2 ,1 ,2)
plot ( x_vect , sigma_r , 'Linewidth' ,2)
ylabel ( '\ sigma_ { r_ { z }}( x ) [ m] ')
xlabel ( 'x [m] ')
grid
axis ([ -100 100 0 0.15])