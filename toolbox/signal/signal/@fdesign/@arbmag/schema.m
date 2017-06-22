function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'arbmag', pk.findclass('abstractarbmag'));
    % 10 11
    if isempty(findtype('arbmagSpecTypeswFDTbx'))
        schema.EnumType('arbmagSpecTypeswFDTbx', {'N,F,A','Nb,Na,F,A','N,B,F,A','Nb,Na,B,F,A'});
        % 13 17
        % 14 17
        % 15 17
        % 16 17
    end % if
    % 18 19
    if isempty(findtype('arbmagSpecTypes'))
        schema.EnumType('arbmagSpecTypes', {'N,F,A','N,B,F,A'});
        % 21 23
        % 22 23
    end % if
    % 24 25
    if isfdtbxinstalled
        spectype = 'arbmagSpecTypeswFDTbx';
    else
        spectype = 'arbmagSpecTypes';
    end % if
    % 30 31
    p = schema.prop(c, 'Specification', spectype);
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
end % function
