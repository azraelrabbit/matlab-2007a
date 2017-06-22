function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('filtresp');
    % 8 11
    % 9 11
    c = schema.class(pk, 'grpdelay', pk.findclass('frequencyresp'));
    % 11 13
    p = schema.prop(c, 'GroupDelayUnits', 'string');
    set(p, 'SetFunction', @setgrpdelay, 'GetFunction', @getgrpdelay);
end % function
function out = setgrpdelay(hObj, out)
    % 16 19
    % 17 19
    hPrm = getparameter(hObj, 'grpdelay');
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
function out = getgrpdelay(hObj, out)
    hPrm = getparameter(hObj, 'grpdelay');
    out = get(hPrm, 'Value');
end % function
