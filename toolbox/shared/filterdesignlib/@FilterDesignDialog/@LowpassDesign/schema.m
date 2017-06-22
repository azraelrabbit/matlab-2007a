function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'LowpassDesign', pk.findclass('AbstractConstrainedDesign'));
    % 10 11
    definetypes;
    % 12 13
    p = schema.prop(c, 'Fpass', 'string');
    set(p, 'FactoryValue', '.45');
    % 15 16
    p = schema.prop(c, 'F3dB', 'string');
    set(p, 'FactoryValue', '.5');
    % 18 19
    p = schema.prop(c, 'F6dB', 'string');
    set(p, 'FactoryValue', '.5');
    % 21 22
    p = schema.prop(c, 'Fstop', 'string');
    set(p, 'FactoryValue', '.55');
    % 24 25
    p = schema.prop(c, 'Apass', 'string');
    set(p, 'FactoryValue', '1');
    % 27 28
    p = schema.prop(c, 'Astop', 'string');
    set(p, 'FactoryValue', '60');
    % 30 31
    spcuddutils.addpostsetprop(c, 'FrequencyConstraints', 'FDDlgLowpassFrequencyConstraints', @set_frequencyconstraints, @lcl_get_frequencyconstraints);
    % 32 35
    % 33 35
    % 34 35
    spcuddutils.addpostsetprop(c, 'MagnitudeConstraints', 'FDDlgLowpassMagnitudeConstraints', @set_magnitudeconstraints, @lcl_get_magnitudeconstraints);
    % 36 37
end % function
function fc = lcl_get_frequencyconstraints(this, fc)
    % 39 42
    % 40 42
    % 41 42
    if isminorder(this)
        fc = 'Passband edge and stopband edge';
    end % if
end % function
function mc = lcl_get_magnitudeconstraints(this, mc)
    % 47 49
    % 48 49
    if isminorder(this)
        mc = 'Passband ripple and stopband attenuation';
    end % if
end % function
function definetypes
    % 54 56
    % 55 56
    if isempty(findtype('FDDlgLowpassFrequencyConstraints'))
        schema.EnumType('FDDlgLowpassFrequencyConstraints', {'Passband edge and stopband edge','Passband edge','Passband edge and 3dB point','Stopband edge','6dB point','3dB point','3dB point and stopband edge'});
        % 58 61
        % 59 61
        % 60 61
    end % if
    % 62 63
    if isempty(findtype('FDDlgLowpassMagnitudeConstraints'))
        schema.EnumType('FDDlgLowpassMagnitudeConstraints', {'Unconstrained','Passband ripple and stopband attenuation','Passband ripple','Stopband attenuation'});
        % 65 67
        % 66 67
    end % if
end % function
