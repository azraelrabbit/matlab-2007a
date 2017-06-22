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
    c = schema.class(pk, 'freqspecs', pk.findclass('freqframe'));
    set(c, 'Description', 'Frequency Specifications');
    % 12 15
    % 13 15
    schema.prop(c, 'AutoUpdate', 'on/off');
    % 15 17
    p = schema.prop(c, 'Values', 'string vector');
    set(p, 'SetFunction', @setvalues, 'GetFunction', @getvalues);
    % 18 20
    p = schema.prop(c, 'Labels', 'string vector');
    set(p, 'SetFunction', @setlabels, 'GetFunction', @getlabels);
end % function
function out = setlabels(hObj, out)
    % 23 26
    % 24 26
    set(getcomponent(hObj, '-class', 'siggui.labelsandvalues'), 'Labels', out);
    out = {''};
end % function
function out = getlabels(hObj, out)
    % 29 32
    % 30 32
    out = get(getcomponent(hObj, '-class', 'siggui.labelsandvalues'), 'Labels');
    if isempty(out)
        out = {''};
    end % if
end % function
function out = setvalues(hObj, out)
    set(getcomponent(hObj, '-class', 'siggui.labelsandvalues'), 'Values', out);
    out = {''};
end % function
function out = getvalues(hObj, out)
    % 41 44
    % 42 44
    out = get(getcomponent(hObj, '-class', 'siggui.labelsandvalues'), 'Values');
    if isempty(out)
        out = {''};
    end % if
end % function
