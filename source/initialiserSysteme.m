function [X0, P0, A, B, H0] = initialiserSysteme(y, coeff)
	X0 = cat(1, [0 0]', y);
	covar_obs = covarianceObservation(y, coeff);
	covar_odom = covarianceOdometrie(y, coeff);
	P0 = zeros(size(covar_obs,1)+size(covar_odom,1));
	P0([1,2], [1,2]) = covar_odom;
	P0(3:end, 3:end) = covar_obs;
	
	A = eye(size(P0));
	B = eye(size(P0,1), 2);

	taille = size(X0);
	taille = taille(1);
	H0 = zeros(taille-2, taille);
	H0([1:taille-2], [3:taille]) = eye(taille-2);
	for i=0:(taille/2)-2
		H0([1+2*i,2+2*i],[1,2]) = -eye(2);
	end
end