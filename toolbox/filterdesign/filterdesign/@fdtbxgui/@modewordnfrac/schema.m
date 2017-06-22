function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdtbxgui');
    c = schema.class(pk, 'modewordnfrac', pk.findclass('abstractwordnfrac'));
    % 10 11
    if isempty(findtype('fdtbxguiQMode'))
        schema.EnumType('fdtbxguiQMode', {'Full precision','Keep LSB','Keep MSB','Specify all'});
    end % if
    % 14 16
    % 15 16
    p = schema.prop(c, 'Mode', 'fdtbxguiQMode');
    set(p, 'SetFunction', @setmode, 'AccessFlags.AbortSet', 'Off');
    % 18 19
    p = schema.prop(c, 'ModeAvailable', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 21 22
    p = schema.prop(c, 'UMS_Listener', 'handle.listener');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
function mode = setmode(this, mode)
    % 26 28
    % 27 28
    h = getcomponent(this, '-class', 'siggui.labelsandvalues');
    % 29 30
    if not(isempty(h))
        switch lower(mode)
        case 'specify all'
            dv = [];
        case 'full precision'
            dv = 1.0:h.Maximum;
        otherwise
            dv = 2.0:h.Maximum;
        end % switch
        set(h, 'DisabledValues', dv);
    end % if
end % function
