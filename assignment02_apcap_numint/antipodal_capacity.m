%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% antipodal_capacity.m
%
% 14/04/2013	Alex Pacini 	CC-BY-NC
%
%	Gives the Antipodal unquantized output capacity and compares it with
%	the AWGN unquantized and the Antipodal 2-Level quantized.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close
clear
Eb_N=[0.01:0.01:10];
for i=[1:length(Eb_N)]
	C(i)=-N_int(@antipodal, -3-3/Eb_N(i), 10+3/Eb_N(i), 10000, 'R_med', Eb_N(i))-1/2*log2(2*pi*exp(1)/Eb_N(i));
end
Eb_NdB= 10*log10(Eb_N);

p=0.5*erfc(sqrt(Eb_N/2));
for j=[1:length(Eb_N)]
	P=[1-p(j), p(j); p(j), 1-p(j)];
	I2LQ(j)= mut_info1 (P,[0.5,0.5]);
end	

pl=plot(Eb_NdB, C,'k', Eb_NdB, 0.5*log2(1+Eb_N), 'r', Eb_NdB, I2LQ, 'b');
grid
set(pl,'LineWidth', 2);
legend('Antipodal, Unquantized', 'AWGN, Unquantized', 'Antipodal, 2-Level Quantization')
xlabel('Eb/N [dB]')
ylabel('C')
print antipodal_capacity.jpg
