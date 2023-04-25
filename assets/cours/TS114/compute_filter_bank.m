function [ H, f] = compute_filter_bank( P, K, R, fs)
% compute_filter_bank Computes Triangular filterbank.
%
%   [H,F]=compute_filter_bank(P,K,R,FS) returns matrix of P triangular filters 
%   (one per row), each K coefficients long along with a K coefficient long 
%   frequency vector F. 
%   The triangular filters are between limits given in R (Hz) and are 
%   uniformly spaced on the mel scale
%
%   Inputs
%           P is the number of filters, i.e., number of rows of H
%
%           K is the length of frequency response of each filter 
%             i.e., number of columns of H
%
%           R is a two element vector that specifies frequency limits (Hz), 
%             i.e., R = [ low_frequency high_frequency ];
%
%           FS is the sampling frequency (Hz)
%
%   Outputs
%           H is a P by K triangular filterbank matrix (one filter per row)
%
%           F is a frequency vector (Hz) of 1xK dimension


    if( nargin~= 4 ), help trifbank; return; end; % very lite input validation
    
    h2w = @( hz )( 1127*log(1+hz/700) );     % Hertz to mel warping function
    w2h = @( mel )( 700*exp(mel/1127)-700 ); % mel to Hertz warping function

    f_min = 0;          % filter coefficients start at this frequency (Hz)
    f_low = R(1);       % lower cutoff frequency (Hz) for the filterbank 
    f_high = R(2);      % upper cutoff frequency (Hz) for the filterbank 
    f_max = 0.5*fs;     % filter coefficients end at this frequency (Hz)
    f = linspace( f_min, f_max, K ); % frequency range (Hz), size 1xK

    % filter cutoff frequencies (Hz) for all filters, size 1x(P+2)
    c = w2h( h2w(f_low)+(0:P+1)*((h2w(f_high)-h2w(f_low))/(P+1)) );
    
    H = zeros( P, K );                  % zero otherwise
    for m = 1:P 
        
        k = f>=c(m)&f<=c(m+1); % up-slope
        H(m,k) = (f(k)-c(m))/(c(m+1)-c(m));
        k = f>=c(m+1)&f<=c(m+2); % down-slope
        H(m,k) = (c(m+2)-f(k))/(c(m+2)-c(m+1));
       
    end

% EOF
