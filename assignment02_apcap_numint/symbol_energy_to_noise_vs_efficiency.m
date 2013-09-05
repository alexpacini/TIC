%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% symbol_energy_to_noise_vs_efficiency.m
%
% 13/04/2013	Alex Pacini 	CC-BY-NC
%
% Script to plot the efficency against the symbol energy to noise ratio
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close
eta=[0:0.01:10];
Esh_N0= 10*log10(((2.^(eta))-1)./eta);
pl=plot(Esh_N0, eta,'-b');
set(pl,'LineWidth', 2);
xlabel('E_{sh}/N_0 [dB]')
ylabel('\eta')
hold on;
xtick= get(gca, 'XTick');
set(gca,'XTick',[-1.6, xtick])
%  plot([Esh_N0(2)]*ones(1,length([0:0.2:10])),[0:0.2:10],'.m');
grid
print efficiency.jpg

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
