function P = covarianceObservation(u, proportionnalite)
	taille = size(Y)/2;
	P = eye(taille);
	for i=1:size(tailles)
		P(i,i) = (proportionnalite*length(Y([2*i-1:2*i])))^2;
	end
end