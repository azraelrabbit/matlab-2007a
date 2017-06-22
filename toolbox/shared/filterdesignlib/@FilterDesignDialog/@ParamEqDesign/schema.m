function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'ParamEqDesign', pk.findclass('AbstractConstrainedDesign'));
    % 10 12
    % 11 12
    definetypes;
    % 13 14
    p = schema.prop(c, 'F0', 'string');
    set(p, 'FactoryValue', '0.5');
    % 16 17
    p = schema.prop(c, 'BW', 'string');
    set(p, 'FactoryValue', '0.3');
    % 19 20
    p = schema.prop(c, 'BWpass', 'string');
    set(p, 'FactoryValue', '0.2');
    % 22 23
    p = schema.prop(c, 'BWstop', 'string');
    set(p, 'FactoryValue', '0.4');
    % 25 26
    p = schema.prop(c, 'Flow', 'string');
    set(p, 'FactoryValue', '0.4');
    % 28 29
    p = schema.prop(c, 'Fhigh', 'string');
    set(p, 'FactoryValue', '0.6');
    % 31 32
    p = schema.prop(c, 'Gref', 'string');
    set(p, 'FactoryValue', '-10');
    % 34 35
    p = schema.prop(c, 'G0', 'string');
    set(p, 'FactoryValue', '0');
    % 37 38
    p = schema.prop(c, 'GBW', 'string');
    set(p, 'FactoryValue', 'db(sqrt(.5))');
    % 40 41
    p = schema.prop(c, 'Gpass', 'string');
    set(p, 'FactoryValue', '-1');
    % 43 44
    p = schema.prop(c, 'Gstop', 'string');
    set(p, 'FactoryValue', '-9');
    % 46 47
    spcuddutils.addpostsetprop(c, 'FrequencyConstraints', 'ParamEqFrequencyConstraints', @set_frequencyconstraints);
    % 48 50
    % 49 50
    spcuddutils.addpostsetprop(c, 'MagnitudeConstraints', 'ParamEqMagnitudeConstraints', @set_magnitudeconstraints);
end % function
function definetypes
    % 53 56
    % 54 56
    % 55 56
    if isempty(findtype('ParamEqFrequencyConstraints'))
        schema.EnumType('ParamEqFrequencyConstraints', {'Center frequency, bandwidth, passband width','Center frequency, bandwidth, stopband width','Center frequency, bandwidth','Low frequency, high frequency'});
        % 58 62
        % 59 62
        % 60 62
        % 61 62
    end % if
    % 63 64
    if isempty(findtype('ParamEqMagnitudeConstraints'))
        schema.EnumType('ParamEqMagnitudeConstraints', {'Reference, center frequency, bandwidth, passband','Reference, center frequency, bandwidth, stopband','Reference, center frequency, bandwidth, passband, stopband','Reference, center frequency, bandwidth'});
        % 66 70
        % 67 70
        % 68 70
        % 69 70
    end % if
end % function
