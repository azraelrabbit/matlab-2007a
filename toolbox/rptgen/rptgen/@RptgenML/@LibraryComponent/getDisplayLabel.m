function dLabel = getDisplayLabel(dao)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dLabel = dao.DisplayName;
    if not(isempty(dao.ComponentInstance))
        try
            dLabel = getName(dao.ComponentInstance);
        end % try
    end % if
    % 13 14
    dLabel = horzcat('   ', dLabel);
end % function
