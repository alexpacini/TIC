%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% hamming74enc.m
%
% 10/05/2013	Alex Pacini 	CC-BY-NC
% 
% 	out = hamming74enc(in)
%	implements the Hamming (7,4) encoder:
%	  * "in": Input bit vector (Its length has to be multiple of 4);
%	  * "out": returns the encoded bit vector.
%	N.B. for Octave users: it needs the package "communication" from 
%	Octave Forge (remember to install and load it).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = hamming74enc(in)

if rem(length(in),4)!=0
	fprintf('Give an input vector with a length multiple of 4 \n');
else
	% I am defining the generator matrix in a systematic form
	G= [1,0,0,0,1,0,1; 0,1,0,0,1,1,1; 0,0,1,0,1,1,0; 0,0,0,1,0,1,1];
	inm= vec2mat(in,4);
	outm= mod(inm*G,2);
	out= reshape(outm.',1,[]);
end
