function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('filtresp');
    % 8 10
    c = schema.class(pk, 'magnitude', pk.findclass('frequencyresp'));
    % 10 12
    p = schema.prop(c, 'MagnitudeDisplay', 'string');
    set(p, 'SetFunction', cellhorzcat(@setprop, 'magnitude'), 'GetFunction', cellhorzcat(@getprop, 'magnitude'));
    % 13 15
    p = schema.prop(c, 'NormalizeMagnitude', 'string');
    set(p, 'SetFunction', cellhorzcat(@setprop, 'normalize_magnitude'), 'GetFunction', cellhorzcat(@getprop, 'normalize_magnitude'));
    % 16 19
    % 17 19
    findclass(findpackage('dspdata'), 'maskline');
    schema.prop(c, 'UserDefinedMask', 'dspdata.maskline');
    % 20 22
    p = vertcat(schema.prop(c, 'MagnitudeFilterListeners', 'handle.listener vector'), schema.prop(c, 'PassbandZoomHandle', 'mxArray'), schema.prop(c, 'PassbandZoomListener', 'handle.listener'));
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 27 29
    schema.prop(c, 'PassbandZoom', 'on/off');
    % 29 31
    p = schema.prop(c, 'OldAutoScale', 'string');
    set(p, 'Visible', 'Off');
end % function
function out = setprop(hObj, out, tag)
    % 34 37
    % 35 37
    hPrm = getparameter(hObj, tag);
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
function out = getprop(hObj, out, tag)
    hPrm = getparameter(hObj, tag);
    if not(isempty(hPrm))
        out = get(hPrm, 'Value');
    else
        out = '';
    end % if
end % function
