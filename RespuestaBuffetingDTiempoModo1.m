% 3 D PLOT OF RESPONSE MODE 1
clear all
close all
Datos
n = length ( L_el );
zoom = 30;
rmax = 0.44;
hold all
% Pillar initially :
xpillar0 = zeros (1 ,10) ;
ypillar0 = zeros (1 ,10) ;
zpillar0 = linspace (0 ,30 ,10) ;
plot3 ( xpillar0 , ypillar0 , zpillar0 , ' -b ', 'Linewidth' ,2)
% Girder initially :
xgirder0 = x_vect ;
ygirder0 = zeros (1 , n);
zgirder0 = ones (1 , n) *30;
plot3 ( xgirder0 , ygirder0 , zgirder0 , ' -k ', 'Linewidth' ,1)
% Girder new :
xgirder = x_vect ;
ygirder = zoom * rmax * Phi (1 ,:) ;
zgirder = zgirder0 ;
plot3 ( xgirder , ygirder , zgirder , '-b ' ,'Linewidth' ,2)
xlabel ( 'x ')
ylabel ( 'y ')
zlabel ( 'z ')
grid on
axis ([ -100 100 -50 50 0 40])