function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtresp');
    % 9 11
    % 10 11
    c = schema.class(pk, 'nlm', findclass(findpackage('sigresp'), 'freqaxiswnfft'));
    c.Description = 'abstract';
    % 13 14
    p = schema.prop(c, 'NumberOfTrials', 'double');
    set(p, 'SetFunction', @setmontecarlo, 'GetFunction', @getmontecarlo, 'AccessFlags.Init', 'Off');
    % 16 18
    % 17 18
    findclass(pk, 'filterutils');
    p = schema.prop(c, 'FilterUtils', 'filtresp.filterutils');
    set(p, 'AccessFlags.PublicSet', 'Off', 'Accessflags.PublicGet', 'Off');
end % function
function out = getmontecarlo(hObj, out)
    % 23 25
    % 24 25
    hPrm = getparameter(hObj, 'montecarlo');
    if not(isempty(hPrm))
        out = get(hPrm, 'Value');
    else
        out = '';
    end % if
end % function
