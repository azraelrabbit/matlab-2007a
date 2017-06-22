function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('adaptfilt');
    % 9 11
    % 10 11
    c = schema.class(pk, 'rlswkalman', findclass(pk, 'abstractrls'));
    c.Description = 'abstract';
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'KalmanGain', 'MATLAB array');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
end % function
