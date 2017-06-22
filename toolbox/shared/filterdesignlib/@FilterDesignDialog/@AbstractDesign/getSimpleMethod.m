function simpleMethod = getSimpleMethod(this, laState)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(nargin, 1.0) && not(isempty(laState))
        dm = laState.DesignMethod;
    else
        dm = this.DesignMethod;
    end % if
    % 13 14
    simpleMethod = lower(dm);
    % 15 16
    switch simpleMethod
    case 'chebyshev type i'
        simpleMethod = 'cheby1';
    case 'chebyshev type ii'
        simpleMethod = 'cheby2';
    case 'butterworth'
        simpleMethod = 'butter';
    case 'elliptic'
        simpleMethod = 'ellip';
    case 'fir least-squares'
        simpleMethod = 'firls';
    case 'iir least-squares'
        simpleMethod = 'iirls';
    case 'window'
        simpleMethod = 'window';
    case 'kaiser window'
        simpleMethod = 'kaiserwin';
    case 'iir least p-norm'
        simpleMethod = 'iirlpnorm';
    case 'interpolated fir'
        simpleMethod = 'ifir';
    case 'multistage equiripple'
        simpleMethod = 'multistage';
    case 'iir quasi-linear phase'
        simpleMethod = 'iirlinphase';
    case 'lagrange interpolation'
        simpleMethod = 'lagrange';
    case 'frequency sampling'
        simpleMethod = 'freqsamp';
    end % switch
end % function
