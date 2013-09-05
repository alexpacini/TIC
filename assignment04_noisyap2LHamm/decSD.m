%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% decSD.m
%
% 10/05/2013	Alex Pacini 	CC-BY-NC
%
%	[words, bits] = decSD(in)
%	implements the minimum euclidean distance decision maker for the 
%	(7,4) Hamming code.
%	  * "in" input bit vector (Its length has to be multiple of 7);
%	  * "CW" a matrix whose rows are the codewords;
%	  * "words" a matrix where the rows represent the words;
%	  * "bits" the output bit vector.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [words, bits] = decSD(in,CW)
inm= vec2mat(in,7);

CW2=CW.';
CW2(CW2==0)=-1;
CW2(CW2==1)=1;
corrv=inm*CW2;

% I define a matrix where each row has the energy of the relative codeword
E=dot(CW2,CW2);
Em=ones(size(inm)(1),1)*E;

% Calculating the matrix where to find the maximum for each row (to get ML)
toMinimize=Em-2*corrv;
[arg, argmin]=min(toMinimize.');
words=CW(argmin,:)(:,[1:4]);
bits= reshape(words.',1,[]);