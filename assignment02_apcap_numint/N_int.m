%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% N_int.m
%
% 14/04/2013	Alex Pacini 	CC-BY-NC
%
%	N_int (f, inf, sup, points), given:
%
%	  * "f", the single variable function to evaluate 
%	    (provide a proper function with @function);
%	  * "low", the integral lower bound;
%	  * "upp", the integral upper bound;
%	  * "intvs", the number of points in which the sum has to be done,
%	  * "method":
%	      * "R_min": calculates by the minimum Riemann sum;
%	      * "R_max": calculates by the maximum Riemann sum;
%	      * "R_med": calculates by the medium point Riemann sum;
%	      * "trapz": calculates by the trapezoidal technique;
%	  * ["otherpar"], optional, used if the function has another variable;
%	
%	numerically calculates the single variable definite integral "fi".
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fi = N_int (f, low, upp, intvs, method, otherpar)

if nargin == 5
	
	dx=(upp-low)/(intvs);
	x= [low:dx:upp];

	if strcmp (method, 'R_min')
		f_intvs=f(x(1:length(x)-1));
		fi= dx*sum(f_intvs);
	
	elseif strcmp (method, 'R_max')
		f_intvs=f(x(2:length(x)));
		fi= dx*sum(f_intvs);
	
	elseif strcmp (method, 'R_med')
		f_intvs=f(x(1:length(x)-1)+dx/2);
		fi= dx*sum(f_intvs);
	
	elseif strcmp (method, 'trapz')
		f_intvs=f(x);
		fi= 1/2*dx*sum((f_intvs(1:length(f_intvs)-1)+f_intvs(2:length(f_intvs))));
	
	else
		fprintf('Choose the right option: used R_med as default \n');
		f_intvs=f(x(1:length(x)-1)+dx/2);
		fi= dx*sum(f_intvs);
	end
end

if nargin == 6
	
	dx=(upp-low)/(intvs);
	x= [low:dx:upp];

	if strcmp (method, 'R_min')
		f_intvs=f(x(1:length(x)-1), otherpar);
		fi= dx*sum(f_intvs);
	
	elseif strcmp (method, 'R_max')
		f_intvs=f(x(2:length(x)), otherpar);
		fi= dx*sum(f_intvs);
	
	elseif strcmp (method, 'R_med')
		f_intvs=f(x(1:length(x)-1)+dx/2, otherpar);
		fi= dx*sum(f_intvs);
	
	elseif strcmp (method, 'trapz')
		f_intvs=f(x, otherpar);
		fi= dx*sum((f_intvs(1:length(f_intvs)-1)+f_intvs(2:length(f_intvs))))/2;
	
	else
		fprintf('Choose the right option: used R_med as default');
		f_intvs=f(x(1:length(x)-1)+dx/2, otherpar);
		fi= dx*sum(f_intvs);
	end
end
