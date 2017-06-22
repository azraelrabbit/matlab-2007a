function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'isinclp', pk.findclass('abstracttypewspecs'));
    % 10 11
    if isempty(findtype('isinclp_specificationtypes'))
        schema.EnumType('isinclp_specificationtypes', {'Fp,Fst,Ap,Ast','N,Fc,Ap,Ast','N,Fp,Ap,Ast','N,Fp,Fst','N,Fst,Ap,Ast'});
        % 13 18
        % 14 18
        % 15 18
        % 16 18
        % 17 18
    end % if
    % 19 20
    p = schema.prop(c, 'Specification', 'isinclp_specificationtypes');
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
end % function
