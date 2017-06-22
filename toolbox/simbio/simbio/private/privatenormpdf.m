function y = privatenormpdf(x, mu, sigma)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if lt(nargin, 1.0)
        error('SimBiology:PRIVATENORMPDF_TOOFEWINPUTS', 'Input argument X is undefined.');
        % 14 15
    end % if
    if lt(nargin, 2.0)
        mu = 0.0;
    end % if
    if lt(nargin, 3.0)
        sigma = 1.0;
    end % if
    % 22 24
    % 23 24
    sigma(le(sigma, 0.0)) = NaN;
    % 25 26
    try
        y = rdivide(exp(mtimes(-.5, power(rdivide(minus(x, mu), sigma), 2.0))), times(sqrt(6.283185307179586), sigma));
    catch
        error('SimBiology:PRIVATENORMPDF_INPUTSIZEMISMATCH', 'Non-scalar arguments must match in size.');
        % 30 31
    end % try
end % function
