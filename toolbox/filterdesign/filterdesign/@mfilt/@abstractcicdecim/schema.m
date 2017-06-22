function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mfilt');
    c = schema.class(pk, 'abstractcicdecim', pk.findclass('abstractcic'));
    set(c, 'Description', 'abstract');
    % 11 13
    % 12 13
    p = vertcat(schema.prop(c, 'BitsPerSection', 'mxArray'), schema.prop(c, 'BitsPerStage', 'mxArray'));
    % 14 15
    set(p, 'Visible', 'Off', 'AccessFlags.Init', 'Off', 'SetFunction', @setbps, 'GetFunction', @getbps);
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'DecimationFactor', 'posint');
    set(p, 'FactoryValue', 2.0, 'SetFunction', @setdecim, 'GetFunction', @getdecim);
    % 23 25
    % 24 25
    p = schema.prop(c, 'InputOffset', 'spt_uint32');
    set(p, 'FactoryValue', 0.0);
    p.AccessFlags.Init = 'off';
end % function
function bps = getbps(this, bps)
    % 30 32
    % 31 32
    bps = get(this, 'SectionWordLengths');
    % 33 36
    % 34 36
    % 35 36
    if all(eq(diff(bps), 0.0))
        bps = bps(1.0);
    end % if
end % function
function bps = setbps(this, bps)
    % 41 43
    % 42 43
    set(this, 'SectionWordLengthMode', 'specify', 'SectionWordLengths', bps);
    % 44 46
    % 45 46
    bps = [];
end % function
