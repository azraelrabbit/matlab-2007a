function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'ciccomp', pk.findclass('abstracttypewspecs'));
    % 10 11
    if isempty(findtype('ciccomp_specificationtypes'))
        schema.EnumType('ciccomp_specificationtypes', {'Fp,Fst,Ap,Ast','N,Fc,Ap,Ast','N,Fp,Ap,Ast','N,Fp,Fst','N,Fst,Ap,Ast'});
        % 13 18
        % 14 18
        % 15 18
        % 16 18
        % 17 18
    end % if
    % 19 21
    % 20 21
    p = schema.prop(c, 'NumberOfSections', 'posint');
    set(p, 'SetFunction', @set_numberofsections, 'FactoryValue', 2.0, 'AccessFlags.Abortset', 'Off');
    % 23 25
    % 24 25
    p = schema.prop(c, 'DifferentialDelay', 'posint');
    set(p, 'SetFunction', @set_differentialdelay, 'FactoryValue', 1.0, 'AccessFlags.Abortset', 'Off');
    % 27 29
    % 28 29
    p = schema.prop(c, 'Specification', 'ciccomp_specificationtypes');
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
end % function
