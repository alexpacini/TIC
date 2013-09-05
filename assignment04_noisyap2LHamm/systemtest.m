%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% systemtest.m
%
% 10/05/2013	Alex Pacini 	CC-BY-NC
% 
% 	Simulates an antipodal 2-Levels transmission over an AWGN channel using 
%	the Hamming block code.
%	N.B. for Octave users: it needs the package "communications" from 
%	Octave Forge (remember to install and load it).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic
clear
clc
close 
Ebc=1;
SNdB=[[-2:0.5:6],[6.2:0.2:8]];

% I create the input bit vector
inbits=rand(1, 2200000);
inbits(inbits<0.5)=0;
inbits(inbits>=0.5)=1;

% I define a matrix whose rows are the codewords
CW=zeros(4,7);
CW(1,:)= hamming74enc([0,0,0,0]);
CW(2,:)= hamming74enc([0,0,0,1]);
CW(3,:)= hamming74enc([0,0,1,0]);
CW(4,:)= hamming74enc([0,0,1,1]);
CW(5,:)= hamming74enc([0,1,0,0]);
CW(6,:)= hamming74enc([0,1,0,1]);
CW(7,:)= hamming74enc([0,1,1,0]);
CW(8,:)= hamming74enc([0,1,1,1]);
CW(9,:)= hamming74enc([1,0,0,0]);
CW(10,:)= hamming74enc([1,0,0,1]);
CW(11,:)= hamming74enc([1,0,1,0]);
CW(12,:)= hamming74enc([1,0,1,1]);
CW(13,:)= hamming74enc([1,1,0,0]);
CW(14,:)= hamming74enc([1,1,0,1]);
CW(15,:)= hamming74enc([1,1,1,0]);
CW(16,:)= hamming74enc([1,1,1,1]);

% The encoded bits pass through the AWGN channel
Rc=4/7;
Eb=Ebc/Rc;
noisybits= antAWGN(hamming74enc(inbits), Eb./10.^(SNdB/10));

%   * Soft decoder
bitSD=zeros(size(noisybits)(1),length(inbits));

for i=[1:size(noisybits)(1)]
	[wordsSD(:,:), bitSD(i,:)]=decSD(noisybits(i,:), CW);
	cerrSD(:,i)=sum(xor(wordsSD(:,:),vec2mat(inbits,4)).');
end

cerrSD(cerrSD>=1)=1;
cerSD=sum(cerrSD)/(size(inbits)(2)/4);
errSD= xor(ones(size(bitSD)(1),1)*inbits, bitSD);
errSD=sum(errSD.');
berSD=errSD/length(inbits);
clear bitSD cerrSD errSD

% Commented for speed concerns
%  i100SD = find(errSD < 99);
%  if isfinite(i100SD)
%  	fprintf('Be careful: the number of errors is under 100. The first below is with N_0 = %f \n',N0(i100SD(1)));
%  end

%   * Hard decoder
bitHD=zeros(size(noisybits)(1),length(inbits));

for i=[1:size(noisybits)(1)]
	[wordsHD(:,:), bitHD(i,:)]=decHD(noisybits(i,:),'', CW);
	cerrHD(:,i)=sum(xor(wordsHD(:,:),vec2mat(inbits,4)).');
end

cerrHD(cerrHD>=1)=1;
cerHD=sum(cerrHD)/(size(inbits)(2)/4);
errHD= xor(ones(size(bitHD)(1),1)*inbits, bitHD);
errHD=sum(errHD.');
berHD=errHD/length(inbits);
clear bitHD errvHD errHD cerrHD noisybits

% Commented for speed concerns
%  i100HD = find(errHD < 99);
%  if isfinite(i100HD)
%  	fprintf('Be careful: the number of errors is under 100. The first below is with N_0 = %f \n',N0(i100HD(1)));
%  end

Rc=1;
Eb=Ebc/Rc;
N0= Eb./10.^(SNdB/10);
noisybits2= antAWGN(inbits,N0);
Xbit=ones(length(N0),1)*inbits;
Y=zeros (length(N0), size(Xbit)(2));
Y(noisybits2<0)=0;
Y(noisybits2>=0)=1;
err= xor(Xbit, Y);
err=sum(err.');
berNoHam=err/length(Y); 
clear Xbit Y errv err

%  p=0.5*erfc(sqrt(1./N0));	
%  subplot (2,1,1), pl1=semilogy(SNdB,abs(berSD),'b',SNdB,abs(berHD),'k',SNdB,abs(berNoHam),'m', SNdB, p, 'r');

% Plotting
subplot (2,1,1), pl1=semilogy(SNdB,abs(berSD),'b',SNdB,abs(berHD),'k',SNdB,abs(berNoHam),'r');
xlabel('Eb/N0 [dB]');
ylabel('Pe bit');
set(pl1,'LineWidth', 2);
legend('Soft Hamming Decoder','Hard (2-L) Hamming Decoder','Hard (2-L) Decoder', 'Location','SouthWest');
grid;
subplot(2,1,2), pl2=semilogy(SNdB,abs(cerSD),'b',SNdB,abs(cerHD),'k');
xlabel('Eb/N0 [dB]');
ylabel('Pe word');
set(pl2,'LineWidth', 2);
legend('Soft Hamming Decoder','Hard (2-L) Hamming Decoder', 'Location','SouthWest');
grid;
print antipodalHamming.jpg

% Frees the memory
clear;
% Get the total computation time
toc
