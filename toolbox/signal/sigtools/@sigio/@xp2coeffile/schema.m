function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigio');
    c = schema.class(pk, 'xp2coeffile', pk.findclass('abstractxpdestination'));
    % 10 11
    if isempty(findtype('fcfFileFormat'))
        schema.EnumType('fcfFileFormat', {'Decimal','Hexidecimal','Binary'});
    end % if
    % 14 15
    schema.prop(c, 'Format', 'fcfFileFormat');
end % function
