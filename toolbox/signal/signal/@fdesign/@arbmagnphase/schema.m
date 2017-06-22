function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'arbmagnphase', pk.findclass('abstractarbmag'));
    % 10 11
    if isempty(findtype('arbmagnphaseSpecTypes'))
        schema.EnumType('arbmagnphaseSpecTypes', {'N,F,H','Nb,Na,F,H','N,B,F,H'});
        % 13 16
        % 14 16
        % 15 16
    end % if
    % 17 18
    spectype = 'arbmagnphaseSpecTypes';
    % 19 20
    p = schema.prop(c, 'Specification', spectype);
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
end % function
