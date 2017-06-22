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
    c = schema.class(pk, 'magspecs', pk.findclass('magframe'));
    set(c, 'Description', 'Magnitude Specifications');
    % 13 15
    % 14 15
    if isempty(findtype('siggui_magspecs_IRType'))
        schema.EnumType('siggui_magspecs_IRType', {'FIRUnits','IIRUnits'});
    end % if
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'FIRunits', 'siggui_magspecs_FIRUnits');
    p.AccessFlags.PublicSet = 'on';
    p.AccessFlags.PublicGet = 'on';
    % 24 26
    % 25 26
    p = schema.prop(c, 'IIRunits', 'siggui_magspecs_IIRUnits');
    p.AccessFlags.PublicSet = 'on';
    p.AccessFlags.PublicGet = 'on';
    % 29 31
    % 30 31
    p = schema.prop(c, 'IRType', 'siggui_magspecs_IRType');
    p.AccessFlags.PublicSet = 'on';
    p.AccessFlags.PublicGet = 'on';
end % function
