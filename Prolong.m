function [ Varnew ] = Prolong ( Var , div )
	% Prolongs Var into a longer function Varnew by interpolation , div = number ofdivisions
	n = length ( Var );
	Varnew = zeros (0 ,(n -1) * div +1) ;
	Varnew (1) = Var (1) ;
	for i = 0:n -2
		delta = ( Var (i +2) - Var (i +1) )/ div ;
		for j = 1: div
			Varnew ( div *i +j +1) = Varnew ( div *i+j ) + delta ;
		end
	end
end
