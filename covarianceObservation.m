function P = covarianceObservation(Y, proportionnalite)
	P = proportionnalite * (diag(Y) ^ 2)