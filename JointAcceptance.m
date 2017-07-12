function [ Jnorm ] = JointAcceptance ( omega , div ,V ,B ,D ,Cd ,Cl , Cdl , L_el , c_nx , A_n , xL_n ,I_n ,dir , Phi , IntPhi_e )
	% Returns the normalized joint acceptance function of mode Phi
	% Defining variables :
	Nomega = length ( omega );
	J = zeros (1 , Nomega );
	xi = 0;
	% The reduced Kaimal spectral density :
	S_n_red = KaimalSpectralDensity ( omega , A_n , xL_n , V);
	% Linear prolongation / expandation of input variables :
	D = Prolong (D , div );
	Cd = Prolong ( Cd , div );
	Cdl = Prolong ( Cdl , div ) ;
	Phi = Prolong ( Phi , div ) ;
	L_el = Expand ( L_el , div );
	n = length ( L_el );
	% Integration :
	for i = 1: n
		Di = D(i );
		Cdi = Cd (i);
		Cdli = Cdl (i);
		L_eli = L_el (i);
		xi = xi + L_eli ;
		Phii = Phi (i);
		xj = 0;
		for j = 1: n
			Dj = D(j );
			Cdj = Cd (j);
			Cdlj = Cdl (j);
			L_elj = L_el (j);
			xj = xj + L_elj ;
			Phij = Phi (j);
			Dx = abs (xi - xj );
			Coij = Co_spectrum ( omega ,Dx , c_nx , V);
			if dir == 1 % mode in y - direction
				J = J + Phii * Phij .* ( (((2* I_n (1) )/ B) ^2* Di * Cdi * Dj * Cdj ) .* Coij(1 ,:) .* S_n_red (1 ,:) + ( Cl * I_n (2) ) ^2 .* Coij (2 ,:) .* S_n_red(2 ,:) ) * L_eli * L_elj ;
			elseif dir == 2 % mode in z - direction
				J = J + Phii * Phij .* ( (2* Cl * I_n (1) ) ^2 .* Coij (1 ,:) .* S_n_red(1 ,:) + (( I_n (2) ^2*( Cdli +( Di * Cdi )/B) *( Cdlj +( Dj * Cdj )/ B)) .*Coij (2 ,:) .* S_n_red (2 ,:) )) * L_eli * L_elj ;
			else
				disp ( ' error ')
			end
		end
	end
	% Normalizing the joint acceptance function :
	Jnorm = J /( IntPhi_e ) ^2;
end