%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% antAWGN.m
%
% 10/04/2013	Alex Pacini 	CC-BY-NC
%
%	out = antAWGN(in, N0)
%	simulates an antipodal 2-Levels transmission over an AWGN channel:
%
% 	  * "in": Input bit vector;
%	  * "N0": [vector of] White Gaussian Noise unilateral powers;
%	  * "out": returns a (length(N0)xlength(in)) matrix, where each row is 
%	    the simulation with a given N0(i).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = antAWGN(in, N0)

N0l= length(N0);
inl= length(in);
randn ('state', 0);
N0=N0.';

noise=sqrt(N0/2)*randn(1, inl);
in(in<0.5)=-1;
in(in>=0.5)=1;
in=ones(N0l,1)*in;
out=in+noise;