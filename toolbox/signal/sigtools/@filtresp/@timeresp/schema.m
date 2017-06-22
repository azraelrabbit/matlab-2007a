function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('filtresp');
    % 8 10
    c = schema.class(pk, 'timeresp', findclass(findpackage('sigresp'), 'timeaxis'));
    c.Description = 'abstract';
    % 11 13
    p = schema.prop(c, 'SpecifyLength', 'on/off');
    set(p, 'SetFunction', @setspecify, 'GetFunction', @getspecify);
    % 14 16
    p = schema.prop(c, 'Length', 'int32');
    set(p, 'SetFunction', @setlength, 'GetFunction', @getlength);
    % 17 19
    findclass(pk, 'filterutils');
    p = schema.prop(c, 'FilterUtils', 'filtresp.filterutils');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
function out = setlength(hObj, out)
    % 23 27
    % 24 27
    % 25 27
    hPrm = getparameter(hObj, 'impzlength');
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
function out = getlength(hObj, out)
    hPrm = getparameter(hObj, 'impzlength');
    out = get(hPrm, 'Value');
end % function
function out = setspecify(hObj, out)
    % 36 39
    % 37 39
    hPrm = getparameter(hObj, 'uselength');
    if not(isempty(hPrm))
        if strcmpi(out, 'on')
            value = 'Specified';
        else
            value = 'Default';
        end % if
        setvalue(hPrm, value);
    end % if
end % function
function out = getspecify(hObj, out)
    % 49 52
    % 50 52
    hPrm = getparameter(hObj, 'uselength');
    out = get(hPrm, 'Value');
    % 53 55
    if strcmpi(out, 'Specified')
        out = 'On';
    else
        out = 'Off';
    end % if
end % function
