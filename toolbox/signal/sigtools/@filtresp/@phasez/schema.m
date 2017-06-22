function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('filtresp');
    % 8 10
    c = schema.class(pk, 'phasez', pk.findclass('abstractphase'));
    % 10 12
    p = schema.prop(c, 'PhaseDisplay', 'string');
    set(p, 'SetFunction', @setphase, 'GetFunction', @getphase);
end % function
function out = setphase(hObj, out)
    % 15 18
    % 16 18
    hPrm = getparameter(hObj, 'phase');
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
function out = getphase(hObj, out)
    hPrm = getparameter(hObj, 'phase');
    if not(isempty(hPrm))
        out = get(hPrm, 'Value');
    else
        out = '';
    end % if
end % function
