function [X0, P0, A, B, H0] = initialiserSysteme(y)
	X0 = [0 0]';
	P0 = covarianceObservation(cat(1, X0, y), 1);
	A = eye(P0);
	B = eye(size(P0));
	% B = B(1:end,1:size(u));

	taille = size(X0);
	taille = taille(1);
	H0 = zeros(taille-2, taille);
	H0([1:taille-2], [3:taille]) = eye(taille-2);
	for i=0:(taille/2)-1
		H0([1+2*i,2+2*i],[1,2]) = -eye(2);
	end
end