function [Xt, Pt] = corrigeEtat(Xts, Pts, Yts, Yt, Ht, Py)
	Kt = (Pts*(Ht'))*inv(Ht*Pts*(Ht')+Py);
	Xt = Xts + Kt*(Yt-Yts);
	Pt = Pts - Kt*Ht*Pts;
end