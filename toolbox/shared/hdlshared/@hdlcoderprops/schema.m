function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mlock;
    % 10 11
    schema.package('hdlcoderprops');
    % 12 14
    % 13 14
    if isempty(findtype('CodeGenerationOutputType'))
        schema.EnumType('CodeGenerationOutputType', {'GenerateHDLCode','DisplayGeneratedModelOnly','GenerateHDLCodeAndDisplayGeneratedModel'});
        % 16 19
        % 17 19
        % 18 19
    end % if
    % 20 21
    if isempty(findtype('HDLuint32'))
        schema.UserType('HDLuint32', 'int32', @check_positive_integer);
    end % if
end % function
function check_positive_integer(value)
    % 26 28
    % 27 28
    if lt(value, 0.0)
        error('Value cannot be less than 0.');
    end % if
end % function
