function P = covarianceOdometrie(u, proportionnalite)
	P = eye(2);
	P(1,1) = (proportionnalite * u(1))^2;
	P(2,2) = (proportionnalite * u(2))^2;
end