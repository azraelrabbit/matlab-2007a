function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'decimator', pk.findclass('abstractmultirate2'));
    % 10 11
    if isempty(findtype('decimator_responses'))
        schema.EnumType('decimator_responses', {'Nyquist','Halfband','Lowpass','CIC','CIC Compensator','Inverse-sinc Lowpass','Highpass','Hilbert','Differentiator','Bandpass','Bandstop','Arbitrary Magnitude','Arbitrary Magnitude and Phase'});
        % 13 16
        % 14 16
        % 15 16
    end % if
    % 17 19
    % 18 19
    p = schema.prop(c, 'privDecimationFactor', 'posint');
    set(p, 'FactoryValue', 2.0, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 21 22
    p = schema.prop(c, 'Response', 'decimator_responses');
    set(p, 'SetFunction', @set_response, 'GetFunction', @get_response, 'AccessFlags.AbortSet', 'Off');
    % 24 26
    % 25 26
    p = schema.prop(c, 'DecimationFactor', 'posint');
    set(p, 'SetFunction', @set_decimationfactor, 'GetFunction', @get_decimationfactor, 'AccessFlags.Init', 'Off');
    % 28 29
end % function
