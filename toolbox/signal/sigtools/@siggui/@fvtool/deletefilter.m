function deletefilter(hFVT, indx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    error(nargchk(2.0, 2.0, nargin));
    % 9 10
    filtobjs = get(hFVT, 'Filters');
    % 11 12
    if isa(indx, 'dfilt.dfiltwfs')
        indx = find(eq(filtobjs, indx));
    end % if
    % 15 17
    % 16 17
    if lt(length(filtobjs), indx)
        error('Index exceeds the number of available filters.');
    end % if
    % 20 22
    % 21 22
    filtobjs(indx) = [];
    % 23 25
    % 24 25
    hFVT.setfilter(filtobjs);
end % function
