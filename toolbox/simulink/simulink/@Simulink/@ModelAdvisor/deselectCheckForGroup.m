function success = deselectCheckForGroup(this, groupNameArray)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if ischar(groupNameArray)
        % 8 9
        groupNameArray = cellhorzcat(groupNameArray);
    end % if
    % 11 12
    try
        success = true;
        % 14 15
        allGroupNameArray = this.getGroupAll;
        if not(isempty(setdiff(groupNameArray, allGroupNameArray)))
            success = false;
        end % if
        % 19 20
        for j=1.0:length(this.CheckCellarray)
            if ismember(this.CheckCellarray{j}.Group, groupNameArray)
                % 22 23
                if not(this.updateCheck(j, false))
                    success = false;
                end % if
            end % if
        end % for
    catch
        success = false;
        rethrow(lasterror);
    end % try
end % function
