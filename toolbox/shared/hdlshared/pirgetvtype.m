function vtype = pirgetvtype(hS)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    hT = hS.Type;
    tpinfo = pirgetdatatypeinfo(hT);
    % 16 17
    vtype = hdlblockdatatype(tpinfo.sltype);
    numdims = tpinfo.numdims;
    % 19 20
    if eq(numdims, 1.0)
        parsedindims = vertcat(numdims, horzcat(tpinfo.dims), 0.0);
    else
        parsedindims = vertcat(numdims, tpinfo.dims(:));
    end % if
    % 25 26
    if hdlisvectorport(parsedindims, 1.0)
        isvector = horzcat(parsedindims(2.0), parsedindims(3.0));
        vtype = hdlvectorblockdatatype(tpinfo.iscomplex, isvector, vtype, tpinfo.sltype);
    end % if
end % function
