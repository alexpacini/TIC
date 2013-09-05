%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% cod.m
%
% 15/04/2013	Alex Pacini 	CC-BY-NC
%
%	ber = cod(N0, points) calculates the Bit Error Ratio "ber" for an 
%	AWGN channel given:
%
% 	  * "N0": White Gaussian Noise unilateral power
%	  * "points": Number of points to perform the simulation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ber = cod(N0, points)

N0l=length(N0);
rand ('state', 0);
randn ('state', 0);
N0=N0.';

Zn=sqrt(N0/2)*randn(1, points);

Xbit=rand(1, points);
Xbit(Xbit<0.5)=-1;
Xbit(Xbit>=0.5)=1;
Xbit=ones(N0l,1)*Xbit;
Y=zeros (N0l, length(Xbit));
Y=Xbit+Zn;

Ybit= zeros( N0l, points);

%  Quantizer
%  Rec. -1
Ybit(Y<0)=-1;
%  Rec. 1
Ybit(Y>=0)=1;

errv= xor(Xbit==1, Ybit==1);
err=sum(errv.');
i100 = find(err < 99);
if isfinite(i100)
	fprintf('Be careful: the number of errors is under 100. The first below is with N_0 = %f \n',N0(i100(1)));
end
ber=err/length(Ybit); 
