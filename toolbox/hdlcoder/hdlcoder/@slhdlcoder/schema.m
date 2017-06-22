function schema
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    schema.package('slhdlcoder');
    % 6 8
    % 7 8
    if isempty(findtype('HDLTargetLanguage'))
        schema.EnumType('HDLTargetLanguage', {'vhdl','verilog'});
        % 10 11
    end % if
end % function
