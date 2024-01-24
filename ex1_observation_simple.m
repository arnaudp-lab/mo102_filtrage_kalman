clear;
addpath(genpath("source"));
fichier = fopen("inputs/FullObservation.data", "r");
coeff_proportionnalite = 0.2;

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
	[X0, P0, A, B, H0] = initialiserSysteme(Y, coeff_proportionnalite);
	positions_prec = [0; 0]
	afficherSysteme(X0, P0, positions_prec);

	% initialisation des variables d'état
	X = X0;
	P = P0;
	finished = false;
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
			pause(1)
			% étape 2: calcul de l'état suivant

			% conversion des entrée fichier vers des vecteurs utilisables
			u = [odom{1} odom{2}]';
			Y = [1:size(percep{1}, 1)*2];
			Y([1:2:end]) = percep{1};
			Y([2:2:end]) = percep{2};
			Y = Y';

			% calcul de l'état suivant
			Q = covarianceOdometrie(u, coeff_proportionnalite);
			[Xts, Pts] = predireEtat(X, u, A, B, P, Q);
			Yts = H0*Xts;
			[Xt, Pt] = corrigeEtat(Xts, Pts, Yts, Y, H0, Pts([3:end],[3:end]));
			afficherSysteme(Xt,Pt, positions_prec)

			% mise à jour des variables d'état
			X = Xt;
			P = Pt;
			positions_prec = cat(1, positions_prec, [X(1); X(2)])
		end
	end
	fclose(fichier);
end