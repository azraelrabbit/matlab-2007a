function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dfilt');
    c = schema.class(pk, 'abstractallpass', pk.findclass('singleton'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'AllpassCoefficients', 'mxArray');
    set(p, 'SetFunction', @set_coeffs, 'GetFunction', @get_coeffs);
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    p = schema.prop(c, 'privallpasscoeffs', 'mxArray');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    p = schema.prop(c, 'refallpasscoeffs', 'mxArray');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 27 30
    % 28 30
    % 29 30
end % function
