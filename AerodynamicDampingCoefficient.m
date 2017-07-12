function [ zeta_ae ] = AerodynamicDampingCoefficient ( rho ,V ,B ,D ,Cd , Cdl , Phi , omega_e ,	m_e , L_el ,dir , IntPhi_e )
	% Returns the buffeting aerodynamic damping coefficient
	Int = 0;
	n = length ( L_el );
	if dir == 1 % Mode in y - direction
		for i = 1: n
			Int = Int + Phi (i) ^2* D(i )* Cd ( i)* L_el (i );
		end
	elseif dir == 2 % Mode in z - direction
		for i = 1: n
			Int = Int + Phi (i) ^2*( B* Cdl (i )+D( i)* Cd (i))* L_el ( i);
		end
	else
		disp ( ' error ')
	end
	zeta_ae = -( rho *V) /(2* omega_e * m_e ) * Int / IntPhi_e ;
end

