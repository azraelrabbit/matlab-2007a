function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'sosviewdlg', pk.findclass('helpdialog'));
    % 10 11
    findclass(findpackage('dspopts'), 'sosview');
    % 12 13
    p = schema.prop(c, 'ViewType', 'sosviewtypes');
    set(p, 'SetFunction', @setviewtype, 'GetFunction', @getviewtype);
    % 15 16
    p = schema.prop(c, 'Custom', 'string');
    set(p, 'FactoryValue', '{1, 1:2}');
    % 18 19
    p = schema.prop(c, 'SecondaryScaling', 'on/off');
    set(p, 'FactoryValue', 'off', 'GetFunction', @get_secondaryscaling);
    % 21 22
    p = schema.prop(c, 'UserModifiedListener', 'handle.listener vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
function ss = get_secondaryscaling(this, ss)
    % 26 28
    % 27 28
    if not(strcmpi(get(this, 'ViewType'), 'cumulative'))
        ss = 'off';
    end % if
end % function
function vt = setviewtype(this, vt)
    % 33 35
    % 34 35
    h = getcomponent(this, '-class', 'siggui.selector');
    set(h, 'Selection', vt);
end % function
function vt = getviewtype(this, vt)
    % 39 41
    % 40 41
    h = getcomponent(this, '-class', 'siggui.selector');
    vt = get(h, 'Selection');
end % function
