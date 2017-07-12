function [ Co_qz ] = Co_spectrumV (D , lambda , Dx )
	% Calculates the normalized co - spectrum of vortex shedding in
	% z - direction
	Co_qz = cos ((2* Dx ) ./(3* lambda *D)) .* exp ( -(( Dx ./(3* lambda *D)) .^2) ) ;
end