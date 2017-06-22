function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pk = findpackage('doppler');
    % 9 12
    % 10 12
    c = schema.class(pk, 'gaussian', findclass(pk, 'baseclass'));
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = schema.prop(c, 'SigmaGaussian', 'udouble');
    p.Description = 'Standard deviation';
    p.FactoryValue = mrdivide(1.0, sqrt(2.0));
    p.SetFunction = @setSigmaGaussian;
end % function
function sigmaGaussian = setSigmaGaussian(h, sigmaGaussian)
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    if not(isnumeric(sigmaGaussian)) || not(isscalar(sigmaGaussian)) || not(isreal(sigmaGaussian)) || le(sigmaGaussian, 0.0) || isnan(sigmaGaussian) || isinf(sigmaGaussian)
        % 31 34
        % 32 34
        error(horzcat(getErrorId(h), ':InvalidSigmaGaussian'), 'SigmaGaussian must be a strictly positive finite scalar real number.');
        % 34 36
    end % if
end % function
