function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'magspecsul', pk.findclass('abstract_specsframe'));
    set(c, 'Description', 'Magnitude Specifications');
    % 11 12
    p = schema.prop(c, 'Labels', 'string vector');
    set(p, 'SetFunction', @setlabels, 'GetFunction', @getlabels);
    % 14 15
    p = schema.prop(c, 'UpperValues', 'string vector');
    set(p, 'SetFunction', @setupper, 'GetFunction', @getupper);
    % 17 18
    p = schema.prop(c, 'LowerValues', 'string vector');
    set(p, 'SetFunction', @setlower, 'GetFunction', @getlower);
end % function
function out = setlabels(hObj, out)
    % 22 24
    % 23 24
    set(getcomponent(hObj, 'Upper'), 'Labels', out);
end % function
function out = getlabels(hObj, out)
    % 27 29
    % 28 29
    out = get(getcomponent(hObj, 'Upper'), 'Labels');
end % function
function out = setupper(hObj, out)
    % 32 34
    % 33 34
    set(getcomponent(hObj, 'Upper'), 'Values', out);
end % function
function out = getupper(hObj, out)
    % 37 39
    % 38 39
    out = get(getcomponent(hObj, 'Upper'), 'Values');
end % function
function out = setlower(hObj, out)
    % 42 44
    % 43 44
    set(getcomponent(hObj, 'Lower'), 'Values', out);
end % function
function out = getlower(hObj, out)
    % 47 49
    % 48 49
    out = get(getcomponent(hObj, 'Lower'), 'Values');
end % function
