function [ S_n_red ] = KaimalSpectralDensity ( omega , A_n , xL_n , V)
	% Returns reduced Kaimal auto spectral density S_n / sigma_n ^2 of the wind in
	% the direction of n = u ( i =1) and n = w ( i =2)
	S_n_red = zeros (2 , length ( omega )) ;
	for i = 1:2
		S_n_red (i ,:) = ( A_n (i)* xL_n ( i)) ./( V *(1+1.5* A_n ( i) .* omega *( xL_n (i)/V )).^(5/3) );
	end
end

