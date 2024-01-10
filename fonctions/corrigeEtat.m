function [Xt, Pt] = corrigeEtat(Xts, Pts, Yts, Yt, Ht, Py)
	Kt = Pts*(Ht')\(Ht*Pts*(Ht')+Py);
	Xt = Xts + Kt*(Yt-Yts);
	Pt = Pts - Kt*Ht*Pts;
end