function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    dpk = findpackage('sigdatatypes');
    findclass(dpk, 'parameter');
    % 10 13
    % 11 13
    c = schema.class(pk, 'winviewer', pk.findclass('siggui'));
    % 13 16
    % 14 16
    p = schema.prop(c, 'Timedomain', 'on/off');
    % 16 18
    p.AccessFlags.AbortSet = 'off';
    % 18 20
    p = schema.prop(c, 'Legend', 'on/off');
    % 20 22
    p.AccessFlags.AbortSet = 'off';
    % 22 24
    schema.prop(c, 'Freqdomain', 'on/off');
    % 24 27
    % 25 27
    schema.prop(c, 'Names', 'mxArray');
    % 27 29
    p = schema.prop(c, 'FreqDisplayMode', 'string');
    p.SetFunction = @setfreqmode;
    p.GetFunction = @getfreqmode;
    % 31 33
    p = schema.prop(c, 'TimeDisplayMode', 'string');
    p.SetFunction = @settimemode;
    p.GetFunction = @gettimemode;
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    p = vertcat(schema.prop(c, 'ParameterDlg', 'siggui.siggui'), schema.prop(c, 'Parameters', 'sigdatatypes.parameter vector'));
    % 42 44
    set(p, 'AccessFlags.PublicSet', 'Off');
end % function
function out = setfreqmode(hView, value)
    % 46 50
    % 47 50
    % 48 50
    out = value;
    hFs = getparameter(hView, 'freqmode');
    if not(isempty(hFs))
        setvalue(hFs, value);
    end % if
end % function
function out = getfreqmode(hView, value)
    hFs = getparameter(hView, 'freqmode');
    out = get(hFs, 'Value');
end % function
function out = settimemode(hView, value)
    % 60 63
    % 61 63
    out = value;
    hFs = getparameter(hView, 'freqmode');
    if not(isempty(hFs))
        if strcmpi(value, 'Samples')
            setvalue(hFs, 'Normalized');
        else
            setvalue(hFs, 'Hz');
        end % if
    end % if
end % function
function out = gettimemode(hView, value)
    % 73 76
    % 74 76
    hFs = getparameter(hView, 'freqmode');
    if strcmpi(get(hFs, 'Value'), 'Normalized')
        out = 'Samples';
    else
        out = 'Time';
    end % if
end % function
