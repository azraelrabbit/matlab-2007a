function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('uimgr');
    inh = findclass(pkg, 'uigroup');
    this = schema.class(pkg, 'uitoolbar', inh);
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(this, 'RenderOrderBugFixFcn', 'MATLAB array');
    p.FactoryValue = [];
    p.Visible = 'off';
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(this, 'RenderOrderBugFixEnabled', 'bool');
    p.FactoryValue = true;
    p.Visible = 'off';
end % function
