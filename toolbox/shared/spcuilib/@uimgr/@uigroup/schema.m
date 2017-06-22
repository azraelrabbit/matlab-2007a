function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('uimgr');
    inh = findclass(pkg, 'uiitem');
    this = schema.class(pkg, 'uigroup', inh);
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    cprop = 'UIGroupConstraintType';
    if isempty(findtype(cprop))
        schema.EnumType(cprop, {'None','SelectOne','SelectZeroOrOne'});
        % 17 18
    end % if
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    p = schema.prop(this, 'SelConInstall', 'MATLAB array');
    p.Visible = 'off';
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    p = schema.prop(this, 'SkipSeparatorComp', 'bool');
    p.FactoryValue = false;
    p.Visible = 'off';
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    p = schema.prop(this, 'TreatAsItemForSyncDst', 'bool');
    p.FactoryValue = false;
    p.Visible = 'off';
    % 47 57
    % 48 57
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    p = schema.prop(this, 'SelectionConstraint', cprop);
    p.FactoryValue = 'None';
    p.SetFunction = @sf_SelectionConstraint;
end % function
function val = sf_SelectionConstraint(h, val)
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    % 66 67
    updateSelectionConstraint(h, val);
end % function
