function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'PeakNotchDesign', pk.findclass('AbstractConstrainedDesign'));
    % 10 12
    % 11 12
    definetypes;
    % 13 14
    schema.prop(c, 'ResponseType', 'PeakNotchResponseTypes');
    % 15 16
    p = schema.prop(c, 'F0', 'string');
    set(p, 'FactoryValue', '0.5');
    % 18 19
    p = schema.prop(c, 'Q', 'string');
    set(p, 'FactoryValue', '2.5');
    % 21 22
    p = schema.prop(c, 'BW', 'string');
    set(p, 'FactoryValue', '0.2');
    % 24 25
    p = schema.prop(c, 'Apass', 'string');
    set(p, 'FactoryValue', '1');
    % 27 28
    p = schema.prop(c, 'Astop', 'string');
    set(p, 'FactoryValue', '60');
    % 30 31
    spcuddutils.addpostsetprop(c, 'FrequencyConstraints', 'PeakNotchFrequencyConstraints', @set_frequencyconstraints);
    % 32 34
    % 33 34
    spcuddutils.addpostsetprop(c, 'MagnitudeConstraints', 'PeakNotchMagnitudeConstraints', @set_magnitudeconstraints);
end % function
function definetypes
    % 37 40
    % 38 40
    % 39 40
    if isempty(findtype('PeakNotchResponseTypes'))
        schema.EnumType('PeakNotchResponseTypes', {'Peak','Notch'});
    end % if
    % 43 44
    if isempty(findtype('PeakNotchFrequencyConstraints'))
        schema.EnumType('PeakNotchFrequencyConstraints', {'Center frequency and quality factor','Center frequency and bandwidth'});
        % 46 48
        % 47 48
    end % if
    % 49 50
    if isempty(findtype('PeakNotchMagnitudeConstraints'))
        schema.EnumType('PeakNotchMagnitudeConstraints', {'Unconstrained','Passband ripple','Stopband attenuation','Passband ripple and stopband attenuation'});
        % 52 56
        % 53 56
        % 54 56
        % 55 56
    end % if
end % function
