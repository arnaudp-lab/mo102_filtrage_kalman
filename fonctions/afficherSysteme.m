function[] = afficherSysteme(X, Px)
	hold on;
	plot(X(1), X(2), 'o');
	taille = size(X)
	taille = taille(1)
	x_vals = X([3:2:taille]);
	y_vals = X([4:2:taille]);
	plot(x_vals, y_vals, '.');
	for i=1:taille/2
		angles = 0:pi/50:2*pi;
		circle_x_vals = Px(i,i) * cos(angles) + x_vals(i);
		circle_y_vals = Px(i,i) * sin(angles) + y_vals(i);
		plot(circle_x_vals, circle_y_vals, '-');
	end
	grid on;
	hold off;
end