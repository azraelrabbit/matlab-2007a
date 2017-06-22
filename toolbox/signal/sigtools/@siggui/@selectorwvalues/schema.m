function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 12
    % 10 12
    % 11 12
    c = schema.class(pk, 'selectorwvalues', pk.findclass('selector'));
    % 13 14
    p = schema.prop(c, 'AllowNonCurrentEditing', 'on/off');
    % 15 16
    p = schema.prop(c, 'Values', 'string vector');
    set(p, 'SetFunction', @setvalues, 'GetFunction', @getvalues);
    % 18 19
    p = schema.prop(c, 'HiddenValues', 'posint_vector');
    set(p, 'SetFunction', @sethiddenvalues, 'GetFunction', @gethiddenvalues);
    % 21 22
    p = schema.prop(c, 'Listeners', 'handle.listener vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
function val = setvalues(this, val)
    % 26 28
    % 27 28
    hlnv = getcomponent(this, '-class', 'siggui.labelsandvalues');
    set(hlnv, 'Values', val);
end % function
function val = getvalues(this, val)
    % 32 34
    % 33 34
    hlnv = getcomponent(this, '-class', 'siggui.labelsandvalues');
    val = get(hlnv, 'Values');
end % function
function hval = sethiddenvalues(this, hval)
    % 38 40
    % 39 40
    hlnv = getcomponent(this, '-class', 'siggui.labelsandvalues');
    set(hlnv, 'HiddenValues', hval);
end % function
function hval = gethiddenvalues(this, hval)
    % 44 46
    % 45 46
    hlnv = getcomponent(this, '-class', 'siggui.labelsandvalues');
    hval = get(hlnv, 'HiddenValues');
end % function
