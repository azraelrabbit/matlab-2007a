function newvhdltype = vhdlvectorportdatatype(complexity, isvector, vhdltype, sltype)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if eq(isvector(2.0), 0.0) || eq(isvector(1.0), 1.0) || eq(isvector(2.0), 1.0)
        veclen = max(isvector);
        if eq(veclen, 0.0)
            error(hdlerrormsgid('zerolenvector'), 'Vector port length of zero!');
            % 11 12
        end % if
        if strcmp(vhdltype, 'std_logic')
            newvhdltype = vhdlvectorblockdatatype(complexity, isvector, vhdltype, sltype);
        else
            prototypedef = sprintf('  TYPE %-32s IS ARRAY (NATURAL RANGE <>) OF %s;\n', horzcat(hdlgetparameter('vector_prefix'), sltype), vhdltype);
            % 17 18
            vhdlpackageaddtypedef(prototypedef);
            newvhdltype = sprintf('%s%s(0 TO %d)', hdlgetparameter('vector_prefix'), sltype, minus(veclen, 1.0));
        end % if
    else
        error(hdlerrormsgid('matrixunsupported'), 'Matrix data types are not supported at this time!');
        % 23 24
    end % if
end % function
