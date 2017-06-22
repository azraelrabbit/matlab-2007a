function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('MECH');
    cls = schema.class(pkg, 'DialogPropertyList');
    % 9 10
    a = MECH.DialogProperty;
    pP = schema.prop(cls, 'Properties', horzcat(class(a), ' vector'));
    pP.AccessFlags.PublicSet = 'off';
end % function
