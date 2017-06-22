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
    pk = findpackage('hdlcoderprops');
    c = schema.class(pk, 'AbstractProp');
    set(c, 'Description', 'abstract');
    % 14 15
    if isempty(findtype('HDLTargetLanguageType'))
        schema.EnumType('HDLTargetLanguageType', {'vhdl','verilog'});
    end % if
    % 18 19
    if isempty(findtype('HDLFinalAddersType'))
        schema.EnumType('HDLFinalAddersType', {'linear','tree','pipelined'});
    end % if
    % 22 23
    if isempty(findtype('HDLMultipliersType'))
        schema.EnumType('HDLMultipliersType', {'multiplier','csd','factored-csd'});
    end % if
end % function
