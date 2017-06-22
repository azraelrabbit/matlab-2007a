function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    pk = findpackage('sigresp');
    % 10 12
    c = schema.class(pk, 'freqaxiswfreqrange', pk.findclass('freqaxis'));
    % 12 14
    p = schema.prop(c, 'FrequencyRange', 'string');
    set(p, 'SetFunction', @setfreqrange, 'GetFunction', @getfreqrange);
    p.Description = 'freqresp';
end % function
function out = getfreqrange(hObj, out)
    % 18 22
    % 19 22
    % 20 22
    hPrm = getparameter(hObj, getfreqrangetag(hObj));
    out = get(hPrm, 'Value');
end % function
function out = setfreqrange(hObj, out)
    % 25 29
    % 26 29
    % 27 29
    hPrm = getparameter(hObj, getfreqrangetag(hObj));
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
