function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfbase');
    % 7 9
    h = schema.class(package, 'rfbase');
    % 9 12
    % 10 12
    p = schema.prop(h, 'Listeners', 'MATLAB array');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.Serialize = 'off';
    p.Visible = 'Off';
    % 16 19
    % 17 19
    p = schema.prop(h, 'Name', 'string');
    p.FactoryValue = '';
    p.AccessFlags.PublicSet = 'Off';
    p.SetFunction = cellhorzcat(@sethandle);
    p.Description = 'Object Name';
    % 23 25
    p = schema.prop(h, 'CopyPropertyObj', 'bool');
    p.FactoryValue = true;
    p.Description = 'Copy Flag';
    p.Visible = 'Off';
    % 28 30
    p = schema.prop(h, 'PropertyChanged', 'bool');
    p.FactoryValue = true;
    p.Description = 'Simulation Flag';
    p.Visible = 'Off';
    % 33 35
    p = schema.prop(h, 'Block', 'string');
    p.FactoryValue = '';
    p.Description = 'Block';
    p.Visible = 'Off';
end % function
function out = sethandle(h, out)
    % 40 42
    if isempty(h.Listeners)
        L(1.0) = handle.listener(h, 'ObjectBeingDestroyed', @destroy);
        set(L(1.0), 'CallbackTarget', h);
        h.Listeners = L;
    end % if
end % function
