function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('adaptalg');
    % 10 12
    % 11 12
    c = schema.class(pk, 'rls', findclass(pk, 'baseclass'));
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(c, 'ForgetFactor', 'double0t1');
    p.FactoryValue = .99;
    % 24 26
    % 25 26
    p = schema.prop(c, 'InvCorrInit', 'posdouble');
    p.FactoryValue = .1;
    % 28 30
    % 29 30
    p = schema.prop(c, 'InvCorrMatrix', 'mxArray');
    p.FactoryValue = .1;
    p.SetFunction = @set_InvCorrMatrix;
end % function
function M = set_InvCorrMatrix(alg, M)
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    S = size(M);
    if ne(length(S), 2.0) || ne(S(1.0), S(2.0)) || ne(S(1.0), alg.nWeightsPrivate)
        error('comm:equalizer:InvCorrMatrix', 'Size of InvCorrMatrix must be nWeights-by-nWeights.');
        % 42 43
    end % if
end % function
