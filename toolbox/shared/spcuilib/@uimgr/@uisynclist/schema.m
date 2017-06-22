function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('uimgr');
    this = schema.class(pkg, 'uisynclist');
    % 10 12
    % 11 12
    p = schema.prop(this, 'Default', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(this, 'FcnRaw', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    % 19 22
    % 20 22
    % 21 22
    schema.prop(this, 'ArgsRaw', 'MATLAB array');
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    schema.prop(this, 'DstName', 'string vector');
end % function
