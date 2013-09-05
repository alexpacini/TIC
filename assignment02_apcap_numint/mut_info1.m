function I = mut_info1 (P, Px)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	mut_info1 (P,Px), given the transition matrix P and the probability
%	vector for the input symbols Px, returns the mutual information I(X;Y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L1=log2(P.');
L1(~isfinite(L1))=0;
HYXx=-diag((P)*L1);
L2=(log2(Px*P)).';
L2(~isfinite(L2))=0;
HY= -(Px*P)*L2;
I=HY -(Px*HYXx);