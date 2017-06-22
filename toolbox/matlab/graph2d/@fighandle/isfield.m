function val = isfield(A, fieldname)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch fieldname
    case {'HandleStore','ObjectStore','Figure','HGHandle'}
        val = 1.0;
    otherwise
        UD = getscribeobjectdata(A.figStoreHGHandle);
        val = isfield(UD, fieldname);
    end % switch
end % function
