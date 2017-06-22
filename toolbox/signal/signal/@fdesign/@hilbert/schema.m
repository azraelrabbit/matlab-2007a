function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'hilbert', pk.findclass('abstracttypewspecs'));
    % 10 11
    if isempty(findtype('firHilbertTransformerSpecTypeswFDTbx'))
        schema.EnumType('firHilbertTransformerSpecTypeswFDTbx', {'N,TW','TW,Ap'});
        % 13 15
        % 14 15
    end % if
    % 16 17
    if isempty(findtype('firHilbertTransformerSpecTypes'))
        schema.EnumType('firHilbertTransformerSpecTypes', {'N,TW'});
        % 19 20
    end % if
    % 21 22
    if isfdtbxinstalled
        spectype = 'firHilbertTransformerSpecTypeswFDTbx';
    else
        spectype = 'firHilbertTransformerSpecTypes';
    end % if
    % 27 28
    p = schema.prop(c, 'Specification', spectype);
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
end % function
