clear;
addpath(genpath("source"));
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
	Y = Y';
	% 1 ère étape: initialisation des variables
	[X0, P0, A, B, H0] = initialiserSysteme(Y, 0.2)
	afficherSysteme(X0, P0);

	finished = false
	while ~finished
		% récupération des informations
		textscan(fichier, "odom : ");
		odom = textscan(fichier, "%f %f");
		textscan(fichier, "percep : ");
		percep = textscan(fichier, "%f %f", 5);
		% caractérise la fin du fichier: il à été impossible de récupérer l'odométrie
		if size(odom{1},1) == 0
			finished = true;
		else
			% étape 2: calcul de l'état suivant
		end
	end
	fclose(fichier);
end