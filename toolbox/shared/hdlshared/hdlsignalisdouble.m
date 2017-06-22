function boolresult = hdlsignalisdouble(idxlist)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    boolresult = zeros(size(idxlist));
    sizelist = idxlist(ne(idxlist, 0.0));
    % 9 10
    sizearr = hdlsignalsizes(sizelist);
    % 11 12
    boolresult(ne(idxlist, 0.0)) = ctranspose(eq(sizearr(:, 1.0), 0.0));
end % function
