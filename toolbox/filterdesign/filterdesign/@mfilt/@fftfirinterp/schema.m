function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    package = findpackage('mfilt');
    parent = findclass(package, 'abstractfirinterp');
    % 13 14
    c = schema.class(package, 'fftfirinterp', parent);
    % 15 16
    p = schema.prop(c, 'fftcoeffs', 'MATLAB array');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 19 20
    p = schema.prop(c, 'BlockLength', 'posint');
    p.SetFunction = @setblocklength;
    p.AccessFlags.Init = 'off';
    % 23 24
    p = schema.prop(c, 'NonProcessedSamples', 'MATLAB array');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
end % function
