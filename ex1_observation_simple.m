fichier = fopen("inputs/FullObservation.data", "r");

if fichier == -1
	disp("Veut pas");
else
	textscan(fichier, "percep : ");
	C = textscan(fichier, "%f %f", 5);

	% Observation initiale
	Y = [1:10];
	Y([1:2:end]) = C{1};
	Y([2:2:end]) = C{2};
	
end