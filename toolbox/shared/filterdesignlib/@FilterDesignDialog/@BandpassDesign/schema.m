function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'BandpassDesign', pk.findclass('AbstractConstrainedDesign'));
    % 10 12
    % 11 12
    definetypes;
    % 13 14
    p = schema.prop(c, 'Fstop1', 'string');
    set(p, 'FactoryValue', '.35');
    % 16 17
    p = schema.prop(c, 'F6dB1', 'string');
    set(p, 'FactoryValue', '.4');
    % 19 20
    p = schema.prop(c, 'F3dB1', 'string');
    set(p, 'FactoryValue', '.4');
    % 22 23
    p = schema.prop(c, 'Fpass1', 'string');
    set(p, 'FactoryValue', '.45');
    % 25 26
    p = schema.prop(c, 'Fpass2', 'string');
    set(p, 'FactoryValue', '.55');
    % 28 29
    p = schema.prop(c, 'F3dB2', 'string');
    set(p, 'FactoryValue', '.6');
    % 31 32
    p = schema.prop(c, 'F6dB2', 'string');
    set(p, 'FactoryValue', '.6');
    % 34 35
    p = schema.prop(c, 'Fstop2', 'string');
    set(p, 'FactoryValue', '.65');
    % 37 38
    p = schema.prop(c, 'BWpass', 'string');
    set(p, 'FactoryValue', '.15');
    % 40 41
    p = schema.prop(c, 'BWstop', 'string');
    set(p, 'FactoryValue', '.25');
    % 43 44
    p = schema.prop(c, 'Astop1', 'string');
    set(p, 'FactoryValue', '60');
    % 46 47
    p = schema.prop(c, 'Apass', 'string');
    set(p, 'FactoryValue', '1');
    % 49 50
    p = schema.prop(c, 'Astop2', 'string');
    set(p, 'FactoryValue', '60');
    % 52 53
    spcuddutils.addpostsetprop(c, 'FrequencyConstraints', 'FDDlgBandpassFrequencyConstraints', @set_frequencyconstraints, @lcl_get_frequencyconstraints);
    % 54 57
    % 55 57
    % 56 57
    spcuddutils.addpostsetprop(c, 'MagnitudeConstraints', 'FDDlgBandpassMagnitudeConstraints', @set_magnitudeconstraints, @lcl_get_magnitudeconstraints);
    % 58 59
end % function
function fc = lcl_get_frequencyconstraints(this, fc)
    % 61 64
    % 62 64
    % 63 64
    if isminorder(this)
        fc = 'Passband and stopband edges';
    end % if
end % function
function mc = lcl_get_magnitudeconstraints(this, mc)
    % 69 71
    % 70 71
    if isminorder(this)
        mc = 'Passband ripple and stopband attenuations';
    end % if
end % function
function definetypes
    % 76 78
    % 77 78
    if isempty(findtype('FDDlgBandpassFrequencyConstraints'))
        schema.EnumType('FDDlgBandpassFrequencyConstraints', {'Passband and stopband edges','Passband edges','Stopband edges','6dB points','3dB points','3dB points and stopband width','3dB points and passband width'});
        % 80 83
        % 81 83
        % 82 83
    end % if
    % 84 85
    if isempty(findtype('FDDlgBandpassMagnitudeConstraints'))
        schema.EnumType('FDDlgBandpassMagnitudeConstraints', {'Unconstrained','Passband ripple and stopband attenuations','Passband ripple','Stopband attenuation'});
        % 87 89
        % 88 89
    end % if
end % function
