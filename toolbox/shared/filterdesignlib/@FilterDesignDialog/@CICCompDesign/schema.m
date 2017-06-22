function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'CICCompDesign', pk.findclass('AbstractConstrainedDesign'));
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
    p = schema.prop(c, 'NumberOfSections', 'string');
    set(p, 'FactoryValue', '2');
    % 30 31
    p = schema.prop(c, 'DifferentialDelay', 'string');
    set(p, 'FactoryValue', '1');
    % 33 34
    spcuddutils.addpostsetprop(c, 'FrequencyConstraints', 'FDDlgCICCompFrequencyConstraints', @set_frequencyconstraints, @lcl_get_frequencyconstraints);
    % 35 38
    % 36 38
    % 37 38
    spcuddutils.addpostsetprop(c, 'MagnitudeConstraints', 'FDDlgCICCompMagnitudeConstraints', @set_magnitudeconstraints, @lcl_get_magnitudeconstraints);
    % 39 40
end % function
function fc = lcl_get_frequencyconstraints(this, fc)
    % 42 45
    % 43 45
    % 44 45
    if isminorder(this)
        fc = 'Passband edge and stopband edge';
    end % if
end % function
function mc = lcl_get_magnitudeconstraints(this, mc)
    % 50 52
    % 51 52
    if isminorder(this)
        mc = 'Passband ripple and stopband attenuation';
    end % if
end % function
function definetypes
    % 57 59
    % 58 59
    if isempty(findtype('FDDlgCICCompFrequencyConstraints'))
        schema.EnumType('FDDlgCICCompFrequencyConstraints', {'Passband edge and stopband edge','Passband edge','Stopband edge','6dB point'});
        % 61 63
        % 62 63
    end % if
    % 64 65
    if isempty(findtype('FDDlgCICCompMagnitudeConstraints'))
        schema.EnumType('FDDlgCICCompMagnitudeConstraints', {'Unconstrained','Passband ripple and stopband attenuation'});
        % 67 68
    end % if
end % function
