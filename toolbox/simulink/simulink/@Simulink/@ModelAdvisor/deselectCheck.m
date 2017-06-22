function success = deselectCheck(this, checkTitleID)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    success = false;
    % 8 9
    selectCount = 0.0;
    if ischar(checkTitleID)
        if isempty(checkTitleID)
            checkTitleID = {};
        else
            % 14 15
            checkTitleID = cellhorzcat(checkTitleID);
        end % if
    end % if
    for i=1.0:length(checkTitleID)
        for j=1.0:length(this.CheckCellarray)
            if strcmp(checkTitleID{i}, this.CheckCellarray{j}.TitleID)
                if this.updateCheck(j, false)
                    selectCount = plus(selectCount, 1.0);
                end % if
                break
            end % if
        end % for
    end % for
    % 28 29
    if eq(selectCount, length(checkTitleID))
        success = true;
    end % if
end % function
