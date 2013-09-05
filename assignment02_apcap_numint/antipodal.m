%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% antipodal.m
%
% 14/04/2013	Alex Pacini 	CC-BY-NC
%
%	Gives the antipodal unquantized output distribution.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function p = antipodal (y,SN)

py=1/2*(sqrt(SN)/sqrt(2*pi))*(exp(-(y+1).^2*SN/2)+exp(-(y-1).^2*SN/2));
p=py.*log2(py);
