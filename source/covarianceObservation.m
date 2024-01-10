function P = covarianceObservation(Y, proportionnalite)
	taille = size(Y);
	taille = (taille(1)/2)-1;
	P = eye(taille);
	for i=1:taille
		P(i,i) = (proportionnalite*norm(Y([2*i+1:2*i+2])))^2;
	end
end