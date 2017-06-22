function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    package = findpackage('dfilt');
    parent = findclass(package, 'dtffir');
    % 12 13
    c = schema.class(package, 'fftfir', parent);
    % 14 15
    p = schema.prop(c, 'fftcoeffs', 'MATLAB array');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 18 19
    p = schema.prop(c, 'BlockLength', 'posint');
    p.SetFunction = @setblocklength;
    p.AccessFlags.Init = 'Off';
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(c, 'NonProcessedSamples', 'MATLAB array');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
end % function
