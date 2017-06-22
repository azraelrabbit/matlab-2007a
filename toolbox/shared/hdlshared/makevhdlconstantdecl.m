function constdecl = makevhdlconstantdecl(index, value)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    vhdlconstant = hdlsignalname(index);
    vhdltype = hdlsignalvtype(index);
    comment = hdlsignalsltype(index);
    % 10 11
    if eq(isempty(comment), 0.0)
        comment = horzcat('-- ', comment);
    end % if
    constdecl = horzcat('  CONSTANT ', sprintf('%-30s', vhdlconstant), ' : ', vhdltype, ' := ', value, '; ', comment, '\n');
end % function
