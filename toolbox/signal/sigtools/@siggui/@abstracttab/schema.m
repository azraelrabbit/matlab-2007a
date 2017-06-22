function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'abstracttab', pk.findclass('sigcontainer'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'CurrentTab', 'posint');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @set_currenttab);
    % 14 15
    p = schema.prop(c, 'DisabledTabs', 'mxArray');
    set(p, 'SetFunction', @set_disabledtabs);
    % 17 18
    if isempty(findtype('leftrighttype'))
        schema.EnumType('leftrighttype', {'Left','Right'});
    end % if
    % 21 22
    schema.prop(c, 'TabAlignment', 'leftrighttype');
    % 23 24
    p = schema.prop(c, 'TabHandles', 'mxArray');
    % 25 27
    % 26 27
    set(p, 'Visible', 'Off');
end % function
function ct = set_currenttab(this, ct)
    % 30 33
    % 31 33
    % 32 33
    if any(eq(ct, this.DisabledTab))
        error('Cannot Set to a DisabledTab.');
    end % if
end % function
function dt = set_disabledtabs(this, dt)
    % 38 40
    % 39 40
    ntabs = length(gettablabels(this));
    % 41 42
    if any(eq(this.CurrentTab, dt))
        set(this, 'CurrentTab', min(setdiff(1.0:ntabs, dt)));
    end % if
end % function
