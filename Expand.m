function [ Varnew ] = Expand ( Var , div )
	% Expands Var into a new function Varnew , each value in Var is divided intodiv values
	n = length ( Var );
	Varnew = zeros (0 ,(n -1) * div +1) ;
	Varnew (2: div ) = ( Var (1) + Var (2) *0.5) / div ;
	Varnew (1) = 0.5* Varnew (2) ;
	for i = 1:n -3
		delta = ( Var (i +1) + Var (i +2) ) /(2* div );
		Varnew ( div *i +1: div *i+ div ) = delta ;
		Varnew ( div *i + div ) = ( delta + ( Var (i +2) + Var (i +3) ) /(2* div )) /2;
	end
	Varnew ((n -2) * div +1:( n -1) * div ) = ( Var (n -1) *0.5+ Var (n)) / div ;
	Varnew ((n -1) * div +1) = 0.5* Varnew ((n -1) * div ) ;
	Varnew ( div *(n -3) + div ) = ( delta + ( Var (i +2) +2* Var (i +3) ) /(2* div )) /2;
end
