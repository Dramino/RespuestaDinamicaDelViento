	% PLOT STANDARD DEVIATION OF BUFFETING RESPONSE
clear all
close all
Datos
% Choose integration accuracy :
omega = linspace (0 ,20 ,2000) ;
div = 4;
n = length ( L_el );
sigma_r = zeros ( n_mod ,n );
for i = 1: n_mod
	sigma_r (i ,:) = StandardDeviation (omega,div,rho,zeta_e,V,B,D,Cd,Cl,Cdl,L_el,c_nx,A_n,xL_n,I_n,i,Phi(i ,:),omega_e(i),m_e(i),IntPhi_e(i)) ;
	plot ( x_vect , sigma_r (i ,:) ,'LineWidth',2)
    %plot ( x_vect , sigma_r (i ,:) )
	hold all
end
grid
xlabel ( 'x [m] ')
ylabel ( '\ sigma_ {r }( x) [m] ')
legend ( '\ sigma_ { r_ { y }}( x ) ','\ sigma_ { r_ {z }}( x) ')