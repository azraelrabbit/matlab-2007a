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
    c = schema.class(pk, 'firlpnormoptsframe', pk.findclass('lpnormoptionsframe'));
    % 12 13
    schema.prop(c, 'MinPhase', 'on/off');
    % 14 16
    % 15 16
    p = schema.prop(c, 'isMinPhase', 'bool');
    set(p, 'SetFunction', @setisminphase, 'Visible', 'Off');
end % function
function out = setisminphase(hObj, out)
    % 20 22
    % 21 22
    if out
        set(hObj, 'minPhase', 'on');
    else
        set(hObj, 'MinPhase', 'off');
    end % if
end % function
