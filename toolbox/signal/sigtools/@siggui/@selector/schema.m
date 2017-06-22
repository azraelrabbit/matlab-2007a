function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    % 8 11
    % 9 11
    c = schema.class(pk, 'selector', pk.findclass('sigcontainer'));
    % 11 14
    % 12 14
    p = schema.prop(c, 'Name', 'string');
    set(p, 'AccessFlags.PublicSet', 'off');
    % 15 17
    p = schema.prop(c, 'Selection', 'string');
    set(p, 'SetFunction', @setselection, 'GetFunction', @getselection, 'AccessFlags.AbortSet', 'Off');
    % 18 21
    % 19 21
    p = schema.prop(c, 'SubSelection', 'string');
    set(p, 'SetFunction', @setsubselection, 'GetFunction', @getsubselection, 'AccessFlags.AbortSet', 'Off');
    % 22 25
    % 23 25
    p = schema.prop(c, 'Identifiers', 'MATLAB array');
    set(p, 'SetFunction', @setids);
    % 26 28
    p = schema.prop(c, 'Strings', 'MATLAB array');
    set(p, 'SetFunction', @setstrs);
    % 29 31
    schema.prop(c, 'CSHTags', 'string vector');
    % 31 35
    % 32 35
    % 33 35
    p = horzcat(schema.prop(c, 'DisabledSelections', 'string vector'), schema.prop(c, 'privSelection', 'string'), schema.prop(c, 'privSubSelection', 'string'), schema.prop(c, 'SelectionListener', 'handle.listener'));
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    set(p, 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off');
    % 41 43
    schema.event(c, 'NewSelection');
    schema.event(c, 'NewSubSelection');
end % function
function out = setids(hObj, out)
    % 46 49
    % 47 49
    if isrendered(hObj) && ne(length(out), length(hObj.Strings))
        error('The number of selections cannot be changed when the selector is rendered.');
    end % if
end % function
function out = setstrs(hObj, out)
    % 53 56
    % 54 56
    if isrendered(hObj) && ne(length(out), length(hObj.Identifiers))
        error('The number of selections cannot be changed when the selector is rendered.');
    end % if
end % function
function out = setselection(hObj, out)
    % 60 63
    % 61 63
    out = getnset(hObj, 'setselection', out);
end % function
function out = getselection(hObj, out)
    % 65 68
    % 66 68
    out = getnset(hObj, 'getselection', out);
end % function
function out = setsubselection(hObj, out)
    % 70 73
    % 71 73
    out = getnset(hObj, 'setsubselection', out);
end % function
function out = getsubselection(hObj, out)
    % 75 78
    % 76 78
    out = getnset(hObj, 'getsubselection', out);
end % function
