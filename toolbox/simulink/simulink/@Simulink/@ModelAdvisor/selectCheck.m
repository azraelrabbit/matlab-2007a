function success = selectCheck(this, checkTitleID)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    success = false;
    % 12 13
    selectCount = 0.0;
    if ischar(checkTitleID)
        if isempty(checkTitleID)
            checkTitleID = {};
        else
            % 18 19
            checkTitleID = cellhorzcat(checkTitleID);
        end % if
    end % if
    for i=1.0:length(checkTitleID)
        for j=1.0:length(this.CheckCellarray)
            if strcmp(checkTitleID{i}, this.CheckCellarray{j}.TitleID)
                if this.updateCheck(j, true)
                    selectCount = plus(selectCount, 1.0);
                end % if
                break
            end % if
        end % for
    end % for
    % 32 33
    if eq(selectCount, length(checkTitleID))
        success = true;
    end % if
end % function
