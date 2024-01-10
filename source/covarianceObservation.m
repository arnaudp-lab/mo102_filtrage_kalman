function P = covarianceObservation(Y, proportionnalite)
	taille = size(Y,1);
	P = eye(taille);
	for i=1:2:taille
		variance = (proportionnalite*norm(Y([i:i+1])))^2;
		P(i,i) = variance;
		P(i+1,i+1) = variance;
	end
end