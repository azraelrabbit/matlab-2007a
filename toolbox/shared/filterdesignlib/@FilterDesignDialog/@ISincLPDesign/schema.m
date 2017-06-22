function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'ISincLPDesign', pk.findclass('AbstractConstrainedDesign'));
    % 10 11
    definetypes;
    % 12 13
    p = schema.prop(c, 'Fpass', 'string');
    set(p, 'FactoryValue', '.45');
    % 15 16
    p = schema.prop(c, 'F6dB', 'string');
    set(p, 'FactoryValue', '.5');
    % 18 19
    p = schema.prop(c, 'Fstop', 'string');
    set(p, 'FactoryValue', '.55');
    % 21 22
    p = schema.prop(c, 'Apass', 'string');
    set(p, 'FactoryValue', '1');
    % 24 25
    p = schema.prop(c, 'Astop', 'string');
    set(p, 'FactoryValue', '60');
    % 27 28
    spcuddutils.addpostsetprop(c, 'FrequencyConstraints', 'FDDlgISincLPFrequencyConstraints', @set_frequencyconstraints, @lcl_get_frequencyconstraints);
    % 29 32
    % 30 32
    % 31 32
    spcuddutils.addpostsetprop(c, 'MagnitudeConstraints', 'FDDlgISincLPMagnitudeConstraints', @set_magnitudeconstraints, @lcl_get_magnitudeconstraints);
    % 33 34
end % function
function fc = lcl_get_frequencyconstraints(this, fc)
    % 36 39
    % 37 39
    % 38 39
    if isminorder(this)
        fc = 'Passband edge and stopband edge';
    end % if
end % function
function mc = lcl_get_magnitudeconstraints(this, mc)
    % 44 46
    % 45 46
    if isminorder(this)
        mc = 'Passband ripple and stopband attenuation';
    end % if
end % function
function definetypes
    % 51 53
    % 52 53
    if isempty(findtype('FDDlgISincLPFrequencyConstraints'))
        schema.EnumType('FDDlgISincLPFrequencyConstraints', {'Passband edge and stopband edge','Passband edge','Stopband edge','6dB point'});
        % 55 57
        % 56 57
    end % if
    % 58 59
    if isempty(findtype('FDDlgISincLPMagnitudeConstraints'))
        schema.EnumType('FDDlgISincLPMagnitudeConstraints', {'Unconstrained','Passband ripple and stopband attenuation'});
        % 61 62
    end % if
end % function
