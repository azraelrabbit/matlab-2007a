function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = schema.package('hdlgui');
    % 9 10
    if isempty(findtype('ResetAssertedLevelType'))
        schema.EnumType('ResetAssertedLevelType', {'Active-high','Active-low'});
    end % if
end % function
