function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'rsrc', pk.findclass('abstractmultirate2'));
    % 10 11
    if isempty(findtype('rsrc_responses'))
        schema.EnumType('rsrc_responses', {'Nyquist','Halfband','Lowpass','CIC Compensator','Inverse-sinc Lowpass','Highpass','Hilbert','Differentiator','Bandpass','Bandstop','Arbitrary Magnitude','Arbitrary Magnitude and Phase'});
        % 13 16
        % 14 16
        % 15 16
    end % if
    % 17 18
    p = schema.prop(c, 'privInterpolationFactor', 'posint');
    set(p, 'FactoryValue', 3.0, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 20 21
    p = schema.prop(c, 'privDecimationFactor', 'posint');
    set(p, 'FactoryValue', 2.0, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 23 24
    p = schema.prop(c, 'Response', 'rsrc_responses');
    set(p, 'SetFunction', @set_response, 'GetFunction', @get_response, 'AccessFlags.AbortSet', 'Off');
    % 26 28
    % 27 28
    p = schema.prop(c, 'InterpolationFactor', 'posint');
    set(p, 'SetFunction', @set_interpolationfactor, 'GetFunction', @get_interpolationfactor, 'AccessFlags.Init', 'Off');
    % 30 33
    % 31 33
    % 32 33
    p = schema.prop(c, 'DecimationFactor', 'posint');
    set(p, 'SetFunction', @set_decimationfactor, 'GetFunction', @get_decimationfactor, 'AccessFlags.Init', 'Off');
    % 35 36
end % function
