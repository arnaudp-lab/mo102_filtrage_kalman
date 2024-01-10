function [X0, P0, A, B, H0] = initialiserSysteme(y, coeff)
	X0 = cat(1, [0 0]', y);
	P0 = covarianceObservation(y, coeff);
	A = eye(size(P0));
	B = eye(size(P0));
	B = B(1:end,1:end);

	taille = size(X0);
	taille = taille(1);
	H0 = zeros(taille-2, taille);
	H0([1:taille-2], [3:taille]) = eye(taille-2);
	for i=0:(taille/2)-1
		H0([1+2*i,2+2*i],[1,2]) = -eye(2);
	end
end