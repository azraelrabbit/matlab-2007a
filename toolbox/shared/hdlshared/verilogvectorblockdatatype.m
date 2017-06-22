function newvtype = verilogvectorblockdatatype(complexity, isvector, vtype, sltype)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if eq(isvector(2.0), 0.0) || eq(isvector(1.0), 1.0) || eq(isvector(2.0), 1.0)
        veclen = max(isvector);
        % 9 10
        newvtype = vtype;
    else
        % 12 13
        error(hdlerrormsgid('matrixunsupported'), 'Matrix data types are not supported at this time!');
        % 14 15
    end % if
end % function
