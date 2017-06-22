function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'nyquist', pk.findclass('abstracttypewband'));
    % 10 11
    if isempty(findtype('nyquistSpecsTypes'))
        schema.EnumType('nyquistSpecsTypes', {'TW,Ast','N','N,Ast','N,TW'});
        % 13 17
        % 14 17
        % 15 17
        % 16 17
    end % if
    % 18 19
    p = schema.prop(c, 'Specification', 'nyquistSpecsTypes');
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
end % function
