function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('filtresp');
    % 8 10
    c = schema.class(pk, 'abstractphase', pk.findclass('frequencyresp'));
    % 10 12
    p = schema.prop(c, 'PhaseUnits', 'string');
    set(p, 'SetFunction', @setphaseunits, 'GetFunction', @getphaseunits);
end % function
function out = setphaseunits(hObj, out)
    % 15 18
    % 16 18
    hPrm = getparameter(hObj, 'phaseunits');
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
function out = getphaseunits(hObj, out)
    hPrm = getparameter(hObj, 'phaseunits');
    if not(isempty(hPrm))
        out = get(hPrm, 'Value');
    else
        out = '';
    end % if
end % function
