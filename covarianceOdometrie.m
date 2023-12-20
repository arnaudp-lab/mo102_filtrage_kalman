function Q = covarianceOdometrie(u, proportionnalite)
	Q = proportionnalite * (diag(u) ^ 2)