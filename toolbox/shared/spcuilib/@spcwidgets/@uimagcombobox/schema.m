function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pkg = findpackage('spcwidgets');
    this = schema.class(pkg, 'uimagcombobox');
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    schema.prop(this, 'Parent', 'MATLAB array');
    % 14 17
    % 15 17
    p = schema.prop(this, 'Enable', 'string');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @(hh,vv)sf_access(hh,vv,'Enabled');
    p.GetFunction = @(hh,vv)gf_access(hh,vv,'Enabled');
    % 20 23
    % 21 23
    p = schema.prop(this, 'Mag', 'double');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @(hh,vv)sf_access(hh,vv,'Mag');
    p.GetFunction = @(hh,vv)gf_access(hh,vv,'Mag');
    % 26 29
    % 27 29
    p = schema.prop(this, 'SelectedItem', 'string');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @(hh,vv)sf_access(hh,vv,'SelectedItem');
    p.GetFunction = @(hh,vv)gf_access(hh,vv,'SelectedItem');
    % 32 35
    % 33 35
    p = schema.prop(this, 'Visible', 'string');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @(hh,vv)sf_access(hh,vv,'Visible');
    p.GetFunction = @(hh,vv)gf_access(hh,vv,'Visible');
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    schema.prop(this, 'Tag', 'string');
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    p = schema.prop(this, 'cb', 'MATLAB array');
    p.Visible = 'off';
    % 51 54
    % 52 54
    p = schema.prop(this, 'api', 'MATLAB array');
    p.Visible = 'off';
function val = sf_access(obj, val, prop)
    % 56 59
    % 57 59
    cb = obj.cb;
    if isjava(cb)
        set(obj.cb, prop, val);
    else
        error('Invalid handle.');
    end % if
function val = gf_access(obj, val, prop)
    % 65 67
    cb = obj.cb;
    if isjava(cb)
        val = get(cb, prop);
        % 69 72
        % 70 72
    end % if
