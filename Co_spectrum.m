function [ Co_nn ] = Co_spectrum ( omega ,Dx , c_nx ,V)
	% Returns normalized co - spectrum of the turbulent wind in the direction of n =u ( i =1) and n = w ( i =2)
	Co_nn = zeros (2 , length ( omega )) ;
	for i = 1:2
		Co_nn (i ,:) = exp (- c_nx (i ) * ( omega * Dx ) /(2 * pi * V));
	end
end
