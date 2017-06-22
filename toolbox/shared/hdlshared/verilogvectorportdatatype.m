function newvtype = verilogvectorportdatatype(complexity, isvector, vtype, sltype)
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
        % 13 14
        newvtype = vtype;
    else
        error(hdlerrormsgid('matrixunsupported'), 'Matrix data types are not supported at this time!');
        % 17 18
    end % if
end % function
