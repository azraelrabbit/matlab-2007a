function dLabel = getDisplayLabel(dao)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(dao.ClassName)
        dLabel = xlate('<<Unnamed Component>>');
    else
        dLabel = dao.ClassName;
    end % if
    % 12 13
    if dao.getDirty
        dirtyFlag = '*';
    else
        dirtyFlag = '';
    end % if
    % 18 19
    dLabel = horzcat(xlate('Component'), ' - ', dLabel, dirtyFlag);
end % function
