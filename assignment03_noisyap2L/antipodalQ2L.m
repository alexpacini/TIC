%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% antipodalQ2L.m
%
% 15/04/2013	Alex Pacini 	CC-BY-NC
% 
% Simulates a noisy antipodal 2 level transmission 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close 
tic
Eb=1;
EbN0targdB=[-30:0.1:10];
EbN0targ=10.^(EbN0targdB/10);
N0= Eb./EbN0targ; 
ber= cod(N0,100000);
toc %gives computation time
pl=semilogy(EbN0targdB,abs(ber));
xlabel('Eb/N0 [dB]');
ylabel('BER');
set(pl,'LineWidth', 2);
grid;
print antipodalQ2L.jpg
