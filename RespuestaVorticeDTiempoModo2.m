% 3 D PLOT OF RESPONSE MODE 2
clear all
close all
Datos
n = length ( L_el );
zoom = 30;
rmax = 0.33;
hold all
% Pillar initially :
xpillar0 = zeros (1 ,10) ;
ypillar0 = zeros (1 ,10) ;
zpillar0 = linspace (0 ,30 ,10) ;
plot3 ( xpillar0 , ypillar0 , zpillar0 , ' -k ', 'Linewidth' ,1)
% Girder initially ;
xgirder0 = x_vect ;
ygirder0 = zeros (1 , n);
zgirder0 = ones (1 , n) *30;
plot3 ( xgirder0 , ygirder0 , zgirder0 , ' -k ', 'Linewidth' ,1)
% Pillar new :
xpillar = zoom * rmax*[0 ,0.00043 ,0.00349 ,0.00929 ,0.01761 ,0.02823 ,0.04092 ,0.05546 ,0.07163 ,0.10794];
ypillar = zeros (1 ,10) ;
zpillar = linspace (0 ,30 ,10) ;
plot3 ( xpillar , ypillar , zpillar , '-b ' ,'Linewidth' ,2)
% Girder new :
xgirder = x_vect + xpillar (10) ;
ygirder = zeros (1 , n);
zgirder = 30 + zoom * rmax * Phi (2 ,:) ;
plot3 ( xgirder , ygirder , zgirder , '-b ' ,'Linewidth' ,2)
xlabel ( 'x ')
ylabel ( 'y ')
zlabel ( 'z ')
grid on
axis ([ -100 100 -50 50 0 40])