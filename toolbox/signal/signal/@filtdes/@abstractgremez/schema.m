function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtdes');
    % 9 10
    c = schema.class(pk, 'abstractgremez', pk.findclass('remez'));
    c.Description = 'abstract';
    % 12 13
    if isempty(findtype('gremezPhase'))
        schema.EnumType('gremezPhase', {'Linear','Minimum','Maximum'});
    end % if
    schema.prop(c, 'Phase', 'gremezPhase');
    % 17 18
    if isempty(findtype('gremezFIRType'))
        schema.EnumType('gremezFIRType', {'Unspecified','1','2','3','4'});
    end % if
end % function
