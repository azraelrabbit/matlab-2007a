function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('sigresp');
    c = schema.class(pk, 'freqaxiswnfft', pk.findclass('freqaxiswfreqrange'));
    % 9 11
    p = schema.prop(c, 'NumberOfPoints', 'double');
    set(p, 'SetFunction', @setnfft, 'GetFunction', @getnfft);
    p.Description = 'freqresp';
end % function
function out = setnfft(hObj, out)
    % 15 19
    % 16 19
    % 17 19
    hPrm = getparameter(hObj, getnffttag(hObj));
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
function out = getnfft(hObj, out)
    % 24 26
    hPrm = getparameter(hObj, getnffttag(hObj));
    out = get(hPrm, 'Value');
end % function
