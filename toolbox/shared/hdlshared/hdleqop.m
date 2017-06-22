function op = hdleqop(op)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    op = strtrim(op);
    % 7 9
    if hdlgetparameter('isvhdl')
        switch op
        case {'~=','!='}
            op = '/=';
        case '=='
            op = '=';
        otherwise
            op = op;
        end % switch
    else
        if hdlgetparameter('isverilog')
            switch op
            case {'~=','/='}
                op = '!=';
            case '='
                op = '==';
            otherwise
                op = op;
            end % switch
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
            % 29 31
        end % if
    end % if
end % function
