% CALCULATES DISTRIBUTED MODAL MASS AND INTEGRATION OF EIGENMODES SQUARED
clear all
close all
data=dlmread('Inputfile.txt','',1,0);
% Length of elements :
L_el = dlmread ( 'Inputfile.txt','',[1 1 43 1]);  %[filai columnai filaj columnaj]
% Number og elements :
n = length ( L_el );
% Lumped mass :
m = dlmread ( 'Inputfile.txt','' ,[1 4 43 4]);
% Eigenvectors :
Phi1 = dlmread ( 'Inputfile.txt','',[1 5 43 5]);
Phi2 = dlmread ( 'Inputfile.txt','' ,[1 6 43 6]);
Phi2x = dlmread ( 'Inputfile.txt','' ,[1 7 43 7]);
Phi=[Phi1 Phi2 Phi2x]';
% Defining variables :
Mmod1 = 0;  
Mmod2 = 0;  
IntPhi1 = 0;
IntPhi2 = 0;
IntPhi2_Lexp = 0;
% Integration over L :
for i = 1: n
	Mmod1 = Mmod1 + Phi1 (i) ^2* m( i)* L_el (i) ;
	IntPhi1 = IntPhi1 + Phi1 ( i) ^2* L_el ( i);
	Mmod2 = Mmod2 + ( Phi2x ( i) ^2 + Phi2 ( i) ^2) * m(i) * L_el (i);
	IntPhi2 = IntPhi2 + ( Phi2x (i) ^2 + Phi2 (i) ^2) * L_el (i );
end
% Integration over Lexp ( for vortex calculations only ) :
for i = [1:13 33:43]
	IntPhi2_Lexp = IntPhi2_Lexp + ( Phi2x (i) ^2 + Phi2 (i) ^2) * L_el (i) ;
end
% Scaling to kg from kN ( gravity Trondheim ) :
s = 1000/9.82;
% Modally equivalent evenly distributed mass :
m1 = ( Mmod1 / IntPhi1 )*s;
m2 = ( Mmod2 / IntPhi2 )*s;
% INPUT DATA
% Geometry :
B = 11.1;
L_el = dlmread ( 'Inputfile.txt','' ,[1 1 43 1]) ;
x_vect = dlmread ( 'Inputfile.txt','',[1 2 43 2]) ;
D = dlmread ( 'Inputfile.txt','',[1 3 43 3]) ;
D_Vortex = 3.4;
% Load Coefficients :
Cd = dlmread ( 'Inputfile.txt','' ,[1 8 43 8]) ;
Cl = 0.5;
Cdl = zeros (1 , length ( L_el ));
% Wind Data (30 masl ) :
rho = 1.25;
% Buffeting :
I_n = [0.14 0.07]; % I_u and I_w
xL_n = [139.04 11.59]; % xfL_u and xfL_w
A_n = [1.08 1.50]; % A_u and A_w
c_nx = [9 6]; % c_ux and c_wx
V = 38.4;
% Vortex Shedding :
St = 0.11;
sigma_qz = 1;
b_z = 0.15;
a_z = 0.4;
lambda_z = 2;
K_az = 0.2;
% E i g e n f r e q u e n c i e s :
omega_e = [1.401 1.687]; % omega_1 and omega_2
n_mod = length ( omega_e );
% Damping :
zeta_e = 0.008; % for both modes
% Modal Mass :
m_e = [11528.01 11762.48]; % m_1 and m_2
% Eigenvectors :
%Phi = [ dlmread ( ' Inputfile . txt ','' ,'F2 .. F44 ') ; dlmread ( ' Inputfile . txt ','' ,'G2 .. G44 ') ]; % mode 2: z - direction
% Integral of eigenvectors squared :
IntPhi_e = [57.69 58.47]; % Int ( Phi (1) ^2) dx and Int ( Phi (2) ^2) dx over L
IntPhi_Lexp = 52.11; % Int ( Phi (2) ^2) dx over L_exp