function success = deselectTask(this, taskNameArray)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    success = false;
    % 8 9
    selectCount = 0.0;
    if ischar(taskNameArray)
        if isempty(taskNameArray)
            taskNameArray = {};
        else
            % 14 15
            taskNameArray = cellhorzcat(taskNameArray);
        end % if
    end % if
    for i=1.0:length(taskNameArray)
        for j=1.0:length(this.TaskCellarray)
            if strcmp(taskNameArray{i}, this.TaskCellarray{j}.TitleID)
                if this.updateTask(j, false)
                    selectCount = plus(selectCount, 1.0);
                end % if
                break
            end % if
        end % for
    end % for
    % 28 29
    if eq(selectCount, length(taskNameArray))
        success = true;
    end % if
end % function
