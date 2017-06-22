function result = makehdlconstantdecl(index, value)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if hdlisbeta2
        % 7 26
        % 8 26
        % 9 26
        % 10 26
        % 11 26
        % 12 26
        % 13 26
        % 14 26
        % 15 26
        % 16 26
        % 17 26
        % 18 26
        % 19 26
        % 20 26
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        index.makeConstant(value);
        % 26 28
        result = '';
    else
        % 29 31
        % 30 33
        % 31 33
        if hdlgetparameter('isvhdl')
            result = makevhdlconstantdecl(index, value);
        else
            if hdlgetparameter('isverilog')
                result = makeverilogconstantdecl(index, value);
            else
                error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
            end % if
            % 40 42
        end % if
    end % if
end % function
