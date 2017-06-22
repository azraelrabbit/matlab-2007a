function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'ArbMagBand');
    % 10 11
    schema.prop(c, 'Frequencies', 'string');
    schema.prop(c, 'Amplitudes', 'string');
    schema.prop(c, 'Magnitudes', 'string');
    schema.prop(c, 'Phases', 'string');
    schema.prop(c, 'FreqResp', 'string');
end % function
