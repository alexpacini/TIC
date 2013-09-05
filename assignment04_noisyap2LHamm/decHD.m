%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% decHD.m
%
% 10/05/2013	Alex Pacini 	CC-BY-NC
%
%	[words, bits] = decHD(in)
%	implements the minimum Hamming distance decision maker for the 
%	(7,4) Hamming code.
%	  * "in" input bit vector (Its length has to be multiple of 7);
%	  * "method":
%	      * 'hamdist' uses the usual Hamming distance (could be buggy and 
%		slow, use it at your own risk);
%	      * '*' (any other string) uses the syndrome decoding (default);
%	  * "CW" a matrix whose rows are the codewords;
%	  * "words" a matrix where the rows represent the words;
%	  * "bits" the output bit vector.
%	N.B. for Octave users: it needs the package "communications" from 
%	Octave Forge (remember to install and load it).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [words, bits] = decHD(in, method, CW)
ins= zeros(size(in));
ins(in<=0)=0;
ins(in>0)=1;
inm= vec2mat(ins,7);

if strcmp (method, 'hamdist')
	
	fprintf('This implementation could have some bugs and it is slow, use it at your own risk \n');
	inR=repmat(ins,size(CW)(1),1);
	CWRep=repmat(CW,1,length(ins)/7);
	CWR=mod(inR+CWRep,2);
	CWRcell=mat2cell(CWR,size(CWR)(1),7*ones(1,size(ins)(2)/7));
	CWRcellT=CWRcell.';
	CWRT=cell2mat(CWRcellT);
	CWR=bi2de(CWRT,'left-msb');
	distM=reshape(CWR.',size(CW)(1),[]);
	[arg, argmin]=min(distM);
	words= CW(argmin,[1:4]);
	bits=reshape(words.',1,[]);
	
else
	% Syndrome decoder
	HT=[1 0 1;1 1 1;1 1 0;0 1 1;1 0 0;0 1 0;0 0 1];
	s=mod(inm*HT,2);
%  	synd=syndtable(HT.'); % Matlab/Octave (pkg communications) function to compute the syndrome
	synd=[0,0,0,0,0,0,0; 0,0,0,0,0,0,1; 0,0,0,0,0,1,0; 0,0,0,1,0,0,0; 0,0,0,0,1,0,0; 1,0,0,0,0,0,0; 0,0,1,0,0,0,0; 0,1,0,0,0,0,0];
	s=bi2de(s,'left-msb');
	s=(ones(size(s))+s).';
	err=synd(s,:);
	words=mod(err+inm,2)(:,[1:4]);
	bits= reshape(words.',1,[]);
end

