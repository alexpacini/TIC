clear
clc
Pin1=[0:1/(200-1):1];
p=[0:1/(200-1):1];
for j=[1:length(Pin1)]
	Px= [Pin1(j), 1-Pin1(j)];
	for i=[1:length(p)]
		P=[1-2*p(i)*(1-p(i)), 2*p(i)*(1-p(i)); 2*p(i)*(1-p(i)), 1-2*p(i)*(1-p(i))];
		I(i,j)= mut_info1 (P,Px);
	end
end	
surf (p,Pin1,I, 'EdgeColor', 'None')
ylabel('Channel "p"')
xlabel('Input Probability')
zlabel('I(X;Y)')
print Dual_BSC.jpg
plot (p,I(:,length(p)/2))
xlabel('Channel "p"')
ylabel('I(X;Y)')
print C_Dual_BSC.jpg