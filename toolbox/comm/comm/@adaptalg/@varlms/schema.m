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
    c = schema.class(pk, 'varlms', findclass(pk, 'baseclass'));
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(c, 'InitStep', 'udouble');
    p.FactoryValue = 0.0;
    % 24 26
    % 25 26
    p = schema.prop(c, 'IncStep', 'udouble');
    p.FactoryValue = .01;
    % 28 30
    % 29 30
    p = schema.prop(c, 'MinStep', 'udouble');
    p.FactoryValue = 0.0;
    % 32 34
    % 33 34
    p = schema.prop(c, 'MaxStep', 'udouble');
    p.FactoryValue = 1.0;
    % 36 38
    % 37 38
    p = schema.prop(c, 'LeakageFactor', 'double0t1');
    p.FactoryValue = 1.0;
    % 40 42
    % 41 42
    p = schema.prop(c, 'GradientVector', 'mxArray');
    p.FactoryValue = 0.0;
    p.Visible = 'off';
    % 45 47
    % 46 47
    p = schema.prop(c, 'StepSize', 'mxArray');
    p.FactoryValue = 0.0;
    p.SetFunction = @setStepSize;
end % function
function s = setStepSize(alg, s)
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    S = size(s);
    if ne(length(S), 2.0) || ne(S(1.0), 1.0) || ne(S(2.0), alg.nWeightsPrivate)
        error('comm:equalizer:StepSizeVector', 'Step size must be a row vector of length nWeights.');
        % 59 60
    end % if
    if not(isequal(s, alg.StepSize))
        alg.GradientVector = zeros(1.0, length(s));
    end % if
end % function
