function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('sigresp');
    % 8 10
    c = schema.class(pk, 'freqaxis', pk.findclass('analysisaxis'));
    % 10 12
    p = schema.prop(c, 'FrequencyScale', 'string');
    set(p, 'SetFunction', cellhorzcat(@setparam, 'freqscale'), 'GetFunction', cellhorzcat(@getparam, 'freqscale'));
    p.Description = 'freqresp';
    % 14 16
    p = schema.prop(c, 'NormalizedFrequency', 'string');
    set(p, 'SetFunction', cellhorzcat(@setparam, 'freqmode'), 'GetFunction', cellhorzcat(@getparam, 'freqmode'));
    p.Description = 'freqresp';
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    p = vertcat(schema.prop(c, 'Listeners', 'handle.listener vector'), schema.prop(c, 'PropListeners', 'handle.listener vector'));
    % 25 29
    % 26 29
    % 27 29
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
function out = setparam(this, out, tag)
    % 31 34
    % 32 34
    hPrm = getparameter(this, tag);
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
function out = getparam(this, out, tag)
    hPrm = getparameter(this, tag);
    out = get(hPrm, 'Value');
end % function
