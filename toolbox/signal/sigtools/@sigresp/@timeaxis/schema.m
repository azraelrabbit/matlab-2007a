function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('sigresp');
    c = schema.class(pk, 'timeaxis', pk.findclass('analysisaxis'));
    % 9 11
    p = schema.prop(c, 'NormalizedFrequency', 'string');
    set(p, 'SetFunction', cellhorzcat(@setprm, 'freqmode'), 'GetFunction', cellhorzcat(@getprm, 'freqmode'));
    % 12 15
    % 13 15
    p = schema.prop(c, 'TimeDisplayMode', 'string');
    set(p, 'SetFunction', @settimedisplaymode, 'GetFunction', @gettimedisplaymode, 'Visible', 'Off');
    % 16 18
    p = schema.prop(c, 'LineStyle', 'string');
    set(p, 'SetFunction', cellhorzcat(@setprm, 'plottype'), 'GetFunction', cellhorzcat(@getprm, 'plottype'));
    % 19 21
    p = schema.prop(c, 'Listeners', 'handle.listener vector');
    % 21 24
    % 22 24
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
function tdm = settimedisplaymode(this, tdm)
    % 26 30
    % 27 30
    % 28 30
    if strcmpi(tdm, 'samples')
        set(this, 'NormalizedFrequency', 'On');
    else
        set(this, 'NormalizedFrequency', 'Off');
    end % if
end % function
function tdm = gettimedisplaymode(this, tdm)
    % 36 39
    % 37 39
    if strcmpi(this.NormalizedFrequency, 'On')
        tdm = 'samples';
    else
        tdm = 'seconds';
    end % if
end % function
function out = setprm(hObj, out, prm)
    % 45 48
    % 46 48
    hPrm = getparameter(hObj, prm);
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
function out = getprm(hObj, out, prm)
    hPrm = getparameter(hObj, prm);
    out = get(hPrm, 'Value');
end % function
