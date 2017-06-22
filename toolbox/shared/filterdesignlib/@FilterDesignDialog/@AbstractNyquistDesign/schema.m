function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'AbstractNyquistDesign', pk.findclass('AbstractConstrainedDesign'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    definetypes;
    % 14 15
    p = schema.prop(c, 'TransitionWidth', 'string');
    set(p, 'FactoryValue', '.1');
    % 17 18
    p = schema.prop(c, 'Astop', 'string');
    set(p, 'FactoryValue', '80');
    % 20 21
    spcuddutils.addpostsetprop(c, 'FrequencyConstraints', 'FDDlgNyquistFrequencyConstraints', @set_frequencyconstraints, @lcl_get_frequencyconstraints);
    % 22 25
    % 23 25
    % 24 25
    spcuddutils.addpostsetprop(c, 'MagnitudeConstraints', 'FDDlgNyquistMagnitudeConstraints', @set_magnitudeconstraints, @lcl_get_magnitudeconstraints);
    % 26 27
end % function
function fc = lcl_get_frequencyconstraints(this, fc)
    % 29 32
    % 30 32
    % 31 32
    if isminorder(this)
        fc = 'Transition width';
    end % if
end % function
function mc = lcl_get_magnitudeconstraints(this, mc)
    % 37 39
    % 38 39
    if isminorder(this)
        mc = 'Stopband attenuation';
    end % if
end % function
function definetypes
    % 44 46
    % 45 46
    if isempty(findtype('FDDlgNyquistFrequencyConstraints'))
        schema.EnumType('FDDlgNyquistFrequencyConstraints', {'Unconstrained','Transition width'});
        % 48 49
    end % if
    % 50 51
    if isempty(findtype('FDDlgNyquistMagnitudeConstraints'))
        schema.EnumType('FDDlgNyquistMagnitudeConstraints', {'Unconstrained','Stopband attenuation'});
        % 53 54
    end % if
end % function
