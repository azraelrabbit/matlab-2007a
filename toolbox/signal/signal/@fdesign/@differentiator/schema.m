function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'differentiator', pk.findclass('abstracttypewspecs'));
    % 10 12
    % 11 12
    if isempty(findtype('firDifferentiatorSpecTypeswFDTbx'))
        schema.EnumType('firDifferentiatorSpecTypeswFDTbx', {'N','N,Fp,Fst','Ap','Fp,Fst,Ap,Ast'});
        % 14 18
        % 15 18
        % 16 18
        % 17 18
    end % if
    % 19 21
    % 20 21
    if isempty(findtype('firDifferentiatorSpecTypes'))
        schema.EnumType('firDifferentiatorSpecTypes', {'N','N,Fp,Fst'});
        % 23 25
        % 24 25
    end % if
    % 26 27
    if isfdtbxinstalled
        spectype = 'firDifferentiatorSpecTypeswFDTbx';
    else
        spectype = 'firDifferentiatorSpecTypes';
    end % if
    % 32 33
    p = schema.prop(c, 'Specification', spectype);
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
end % function
