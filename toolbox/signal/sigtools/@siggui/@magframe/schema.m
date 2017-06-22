function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'magframe', pk.findclass('abstract_specsframe'));
    set(c, 'Description', 'abstract');
    % 13 15
    % 14 15
    p = schema.prop(c, 'Values', 'string vector');
    p.SetFunction = @set_values;
    p.GetFunction = @get_values;
    % 18 19
    p = schema.prop(c, 'Labels', 'string vector');
    p.SetFunction = @set_labels;
    p.GetFunction = @get_labels;
end % function
function P = get_values(h, dummy)
    % 24 26
    % 25 26
    lvh = getcomponent(h, '-class', 'siggui.labelsandvalues');
    % 27 28
    P = get(lvh, 'Value');
end % function
function dummy = set_values(h, P)
    % 31 33
    % 32 33
    lvh = getcomponent(h, '-class', 'siggui.labelsandvalues');
    % 34 35
    set(lvh, 'Values', P);
    % 36 37
    dummy = {''};
end % function
function P = get_labels(h, dummy)
    % 40 42
    % 41 42
    lvh = getcomponent(h, '-class', 'siggui.labelsandvalues');
    % 43 44
    P = get(lvh, 'labels');
end % function
function dummy = set_labels(h, P)
    % 47 49
    % 48 49
    lvh = getcomponent(h, '-class', 'siggui.labelsandvalues');
    % 50 51
    set(lvh, 'Labels', P);
    % 52 53
    dummy = {''};
end % function
