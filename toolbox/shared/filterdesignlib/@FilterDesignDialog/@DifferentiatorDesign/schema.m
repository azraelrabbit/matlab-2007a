function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'DifferentiatorDesign', pk.findclass('AbstractConstrainedDesign'));
    % 10 12
    % 11 12
    definetypes;
    % 13 14
    p = schema.prop(c, 'Fpass', 'string');
    set(p, 'FactoryValue', '0.45');
    % 16 17
    p = schema.prop(c, 'Fstop', 'string');
    set(p, 'FactoryValue', '0.55');
    % 19 20
    p = schema.prop(c, 'Apass', 'string');
    set(p, 'FactoryValue', '1');
    % 22 23
    p = schema.prop(c, 'Astop', 'string');
    set(p, 'FactoryValue', '60');
    % 25 26
    spcuddutils.addpostsetprop(c, 'FrequencyConstraints', 'FDDlgDifferentiatorFrequencyConstraints', @set_frequencyconstraints, @lcl_get_frequencyconstraints);
    % 27 30
    % 28 30
    % 29 30
    spcuddutils.addpostsetprop(c, 'MagnitudeConstraints', 'FDDlgDifferentiatorMagnitudeConstraints', @set_magnitudeconstraints, @lcl_get_magnitudeconstraints);
    % 31 32
end % function
function fc = lcl_get_frequencyconstraints(this, fc)
    % 34 37
    % 35 37
    % 36 37
    if isminorder(this)
        fc = 'Passband edge and stopband edge';
    end % if
end % function
function mc = lcl_get_magnitudeconstraints(this, mc)
    % 42 44
    % 43 44
    if isminorder(this)
        mc = 'Passband ripple and stopband attenuation';
    end % if
end % function
function definetypes
    % 49 51
    % 50 51
    if isempty(findtype('FDDlgDifferentiatorFrequencyConstraints'))
        schema.EnumType('FDDlgDifferentiatorFrequencyConstraints', {'Unconstrained','Passband edge and stopband edge'});
        % 53 54
    end % if
    % 55 56
    if isempty(findtype('FDDlgDifferentiatorMagnitudeConstraints'))
        schema.EnumType('FDDlgDifferentiatorMagnitudeConstraints', {'Unconstrained','Passband ripple and stopband attenuation','Passband ripple'});
        % 58 60
        % 59 60
    end % if
end % function
