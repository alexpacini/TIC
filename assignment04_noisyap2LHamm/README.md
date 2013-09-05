# Assignment #4

## hamming74enc.m

> 	 out = hamming74enc(in)

> A Matlab/ __Octave__ function that, given:
>
> * "in": Input bit vector (Its length has to be multiple of 4);  
> * "out": returns the encoded bit vector;
>
> implements the Hamming (7,4) encoder.  
> N.B. for Octave users: it needs the package "communication" from 
> Octave Forge (remember to install and load it).

## antAWGN.m

> 	 out = antAWGN(in, N0)
>
> A Matlab/ __Octave__ function that simulates an antipodal 
> 2-Levels transmission over an AWGN channel, given:
>
> * "in": Input bit vector;  
> * "N0": [vector of] White Gaussian Noise unilateral powers;
>
> and returns:
>
> * "out": a (length(N0)xlength(in)) matrix, where each row is 
> the simulation with a given N0(i).

## decHD.m

>	[words, bits] = decHD(in, method, CW)
>
> A Matlab/ __Octave__ function that implements the minimum Hamming 
> distance decision maker for the (7,4) Hamming code.
>
> Inputs:
>
> * "in": input bit vector (Its length has to be multiple of 7);  
> * "method":  
>   * 'hamdist': uses the usual Hamming distance (could be buggy and slow);  
>   * '*': (any other string) uses the syndrome decoding (default);  
> * "CW": a matrix whose rows are the codewords;  
>
> Outputs:
>
> * "words": a matrix where the rows represent the words;   
> * "bits": the output bit vector.
>
> N.B. for Octave users: it needs the package "communications" from 
> Octave Forge (remember to install and load it).

## decSD.m

>	[words, bits] = decSD(in, CW)
>
> A Matlab/ __Octave__ function that implements the minimum euclidean 
> distance decision maker for the (7,4) Hamming code. 
>
> Inputs:
>
> * "in": input bit vector (Its length has to be multiple of 7);  
> * "CW": a matrix whose rows are the codewords;  
>
> Outputs:
>
> * "words": a matrix where the rows represent the words;   
> * "bits": the output bit vector.
>
> N.B. for Octave users: it needs the package "communications" from 
> Octave Forge (remember to install and load it).

## systemtest.m

> A Matlab/ __Octave__ script that simulates an antipodal 2-Levels transmission 
> over an AWGN channel using the Hamming block code.  
> It plots the bit error probability using the minimum euclidean distance decision maker (SD),
> the minimum Hamming distance decision maker (HD) and the uncoded transmission.  
> N.B. for Octave users: it needs the package "communications" from 
> Octave Forge (remember to install and load it).  
> With the default values it needs about 3GB of RAM.

## antipodalHamming.jpg

> The plot of _systemtest.m_
![antipodalHamming.jpg](https://raw.github.com/alexpacini/Uni.Snippets/master/TIC/assignment04_noisyap2LHamm/antipodalHamming.jpg)
