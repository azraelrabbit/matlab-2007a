function success = deselectCheckForTask(this, taskNameArray)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if ischar(taskNameArray)
        % 8 9
        taskNameArray = cellhorzcat(taskNameArray);
    end % if
    % 11 12
    try
        success = true;
        % 14 15
        allTaskNameArray = this.getTaskAll;
        if not(isempty(setdiff(taskNameArray, allTaskNameArray)))
            success = false;
        end % if
        % 19 21
        % 20 21
        for i=1.0:length(this.TaskCellArray)
            if ismember(this.TaskCellArray{i}.TitleID, taskNameArray)
                for j=1.0:length(this.TaskCellArray{i}.CheckIndex)
                    recordSerialNum = str2num(this.TaskCellArray{i}.CheckIndex{j});
                    % 25 26
                    if not(this.updateCheckForTask(recordSerialNum, false))
                        success = false;
                    end % if
                end % for
            end % if
        end % for
    catch
        success = false;
        rethrow(lasterror);
    end % try
end % function
