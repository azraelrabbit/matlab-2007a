function aObjH = getobj(HG)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    ud = getscribeobjectdata(HG);
    if isfield(ud, 'HandleStore')
        aObjH = ud.HandleStore;
    else
        aObjH = [];
    end % if
end % function
