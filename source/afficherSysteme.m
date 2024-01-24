function[] = afficherSysteme(X, Px, positions_prec)
	clf;
	hold on;
	% affichage des positions précédentes
	plot(positions_prec(1:2:end), positions_prec(2:2:end), '-');

	% affichage de la position courante
	plot(X(1), X(2), 'o');

	% affichage des amers
	taille = size(X, 1);
	x_vals = X([1:2:taille]);
	y_vals = X([2:2:taille]);
	plot(x_vals, y_vals, '.');
	for i=1:(taille/2)-1
		angles = 0:pi/50:2*pi;
		circle_x_vals = Px(i,i) * cos(angles) + x_vals(i);
		circle_y_vals = Px(i,i) * sin(angles) + y_vals(i);
		plot(circle_x_vals, circle_y_vals, '-');
	end
	grid on;
	hold off;
end