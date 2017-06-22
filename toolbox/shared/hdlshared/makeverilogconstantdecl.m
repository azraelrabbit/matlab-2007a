function constdecl = makeverilogconstantdecl(index, value)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(index, 0.0) || ge(index, hdlsignalnext)
        error('hdlcoder:makeverilogconstantdecl:badindex', 'The symbol index %d in makeverilogconstantdecl is out of bounds', index);
        % 10 11
    end % if
    % 12 13
    vconstant = hdlsignalname(index);
    vtype = hdlsignalvtype(index);
    sltype = hdlsignalsltype(index);
    [size, bp, signed] = hdlwordsize(sltype);
    % 17 18
    array_deref = hdlgetparameter('array_deref');
    % 19 20
    comment = sltype;
    if eq(isempty(comment), 0.0)
        comment = horzcat(hdlgetparameter('comment_char'), comment);
    end % if
    % 24 25
    if signed && ne(size, 0.0) && ne(size, 1.0)
        signedstr = 'signed ';
        sizestr = sprintf('%s%d:0%s ', array_deref(1.0), minus(size, 1.0), array_deref(2.0));
    else
        signedstr = '';
        sizestr = '';
    end % if
    % 32 33
    constdecl = horzcat('  parameter ', signedstr, sizestr, sprintf('%s', vconstant), ' = ', value, '; ', comment, '\n');
end % function
