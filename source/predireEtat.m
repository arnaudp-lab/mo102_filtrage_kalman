function[Xts, Pts] = predireEtat(Xlast, ulast, A, B, Plast, Q)
	Xts = Xlast + B*ulast;
	Pts = A*Plast*(A') + B*Q*(B');
end