function signaldecl = makehdlsignaldecl(index)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if hdlisbeta2
        % 8 21
        % 9 21
        % 10 21
        % 11 21
        % 12 21
        % 13 21
        % 14 21
        % 15 21
        % 16 21
        % 17 21
        % 18 21
        % 19 21
        signaldecl = '';
    else
        % 22 25
        % 23 25
        signaldecl = '';
        for n=1.0:length(index)
            signaldecl = horzcat(signaldecl, scalarsignaldecl(index(n)));
        end % for
    end
end
function signaldecl = scalarsignaldecl(index)
    % 31 34
    % 32 34
    vsignal = hdlsignalname(index);
    vtype = hdlsignalvtype(index);
    sltype = hdlsignalsltype(index);
    vector = hdlsignalvector(index);
    % 37 39
    initializer = '';
    if hdlgetparameter('initialize_real_signals')
        if hdlgetparameter('isvhdl')
            if strcmp(vtype, 'real')
                initializer = ' := 0.0';
            else
                if strcmp(sltype, 'double') && ne(any(vector), 0.0)
                    veclen = max(vector);
                    initializer = horzcat(' := (', sprintf('%2.1f, ', zeros(1.0, minus(veclen, 1.0))), '0.0)');
                end
            end
        else
            if hdlgetparameter('isverilog')
                if strcmp(vtype, 'real') && eq(length(vector), 1.0) && eq(vector, 0.0)
                    initializer = ' = 0.0';
                else
                    if strcmp(sltype, 'double') && ne(any(vector), 0.0)
                        veclen = max(vector);
                        initializer = horzcat(' = {', sprintf('%2.1f, ', zeros(1.0, minus(veclen, 1.0))), '0.0}');
                    end
                end
            else
                error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
            end
        end
    end
    comment = sltype;
    if not(isempty(comment))
        comment = horzcat(hdlgetparameter('comment_char'), ' ', comment);
    end
    if ne(length(vector), 1.0) || ne(vector, 0.0)
        if eq(vector(2.0), 0.0) || eq(vector(1.0), 1.0) || eq(vector(2.0), 1.0)
            vectordecl = sprintf(' [0:%d] ', minus(max(vector), 1.0));
        else
            error(hdlerrormsgid('notsupported'), 'Matrix data types are not supported at this time!');
        end
    else
        vectordecl = '';
    end
    if hdlgetparameter('isvhdl')
        signaldecl = horzcat('  SIGNAL ', sprintf('%-32s', vsignal), ' : ', vtype, initializer, '; ', comment, '\n');
    else
        if hdlgetparameter('isverilog')
            signaldecl = horzcat('  ', vtype, ' ', sprintf('%s', vsignal), vectordecl, '; ', comment, '\n');
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
            % 84 86
        end
    end
    % 87 89
    if eq(hdlsignalcomplex(index), 1.0)
        vsignal = hdlsignalname(hdlsignalimag(index));
        vtype = hdlsignalvtype(hdlsignalimag(index));
        comment = hdlsignalsltype(hdlsignalimag(index));
        % 92 94
        if not(isempty(comment))
            comment = horzcat(hdlgetparameter('comment_char'), ' ', comment);
        end
        % 96 98
        if hdlgetparameter('isvhdl')
            signaldecl = horzcat('  SIGNAL ', sprintf('%-32s', vsignal), ' : ', vtype, initializer, '; ', comment, '\n');
        else
            if hdlgetparameter('isverilog')
                signaldecl = horzcat('  ', vtype, ' ', sprintf('%s', vsignal), vectordecl, '; ', comment, '\n');
            else
                error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
                % 104 106
            end
        end
    end
end
