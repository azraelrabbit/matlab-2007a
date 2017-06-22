function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'BandstopDesign', pk.findclass('AbstractConstrainedDesign'));
    % 10 12
    % 11 12
    definetypes;
    % 13 14
    p = schema.prop(c, 'Fpass1', 'string');
    set(p, 'FactoryValue', '.35');
    % 16 17
    p = schema.prop(c, 'F3dB1', 'string');
    set(p, 'FactoryValue', '.4');
    % 19 20
    p = schema.prop(c, 'F6dB1', 'string');
    set(p, 'FactoryValue', '.4');
    % 22 23
    p = schema.prop(c, 'Fstop1', 'string');
    set(p, 'FactoryValue', '.45');
    % 25 26
    p = schema.prop(c, 'Fstop2', 'string');
    set(p, 'FactoryValue', '.55');
    % 28 29
    p = schema.prop(c, 'F6dB2', 'string');
    set(p, 'FactoryValue', '.6');
    % 31 32
    p = schema.prop(c, 'F3dB2', 'string');
    set(p, 'FactoryValue', '.6');
    % 34 35
    p = schema.prop(c, 'Fpass2', 'string');
    set(p, 'FactoryValue', '.65');
    % 37 38
    p = schema.prop(c, 'BWpass', 'string');
    set(p, 'FactoryValue', '.25');
    % 40 41
    p = schema.prop(c, 'BWstop', 'string');
    set(p, 'FactoryValue', '.15');
    % 43 44
    p = schema.prop(c, 'Apass1', 'string');
    set(p, 'FactoryValue', '1');
    % 46 47
    p = schema.prop(c, 'Astop', 'string');
    set(p, 'FactoryValue', '60');
    % 49 50
    p = schema.prop(c, 'Apass2', 'string');
    set(p, 'FactoryValue', '1');
    % 52 53
    spcuddutils.addpostsetprop(c, 'FrequencyConstraints', 'FDDlgBandstopFrequencyConstraints', @set_frequencyconstraints, @lcl_get_frequencyconstraints);
    % 54 57
    % 55 57
    % 56 57
    spcuddutils.addpostsetprop(c, 'MagnitudeConstraints', 'FDDlgBandstopMagnitudeConstraints', @set_magnitudeconstraints, @lcl_get_magnitudeconstraints);
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
    % 69 72
    % 70 72
    % 71 72
    if isminorder(this)
        mc = 'Passband ripples and stopband attenuation';
    end % if
end % function
function definetypes
    % 77 79
    % 78 79
    if isempty(findtype('FDDlgBandstopFrequencyConstraints'))
        schema.EnumType('FDDlgBandstopFrequencyConstraints', {'Passband and stopband edges','Passband edges','Stopband edges','6dB points','3dB points','3dB points and stopband width','3dB points and passband width'});
        % 81 84
        % 82 84
        % 83 84
    end % if
    % 85 86
    if isempty(findtype('FDDlgBandstopMagnitudeConstraints'))
        schema.EnumType('FDDlgBandstopMagnitudeConstraints', {'Unconstrained','Passband ripples and stopband attenuation','Passband ripple','Stopband attenuation'});
        % 88 90
        % 89 90
    end % if
end % function
