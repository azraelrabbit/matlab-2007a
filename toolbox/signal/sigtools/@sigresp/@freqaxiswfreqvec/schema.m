function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('sigresp');
    % 8 10
    c = schema.class(pk, 'freqaxiswfreqvec', pk.findclass('freqaxiswnfft'));
    % 10 13
    % 11 13
    p = schema.prop(c, 'FrequencyVector', 'double_vector');
    set(p, 'SetFunction', @setfreqvec, 'GetFunction', @getfreqvec);
    p.Description = 'freqaxiswfreqvec';
end % function
function out = setfreqvec(hObj, out)
    % 17 20
    % 18 20
    hPrm = getparameter(hObj, 'freqvec');
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
function out = getfreqvec(hObj, out)
    hPrm = getparameter(hObj, 'freqvec');
    out = get(hPrm, 'Value');
end % function
