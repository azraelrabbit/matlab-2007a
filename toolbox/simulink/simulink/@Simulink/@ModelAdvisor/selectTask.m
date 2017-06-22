function success = selectTask(this, taskNameArray)
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
    if isstr(taskNameArray)
        if isempty(taskNameArray)
            taskNameArray = {};
        else
            % 18 19
            taskNameArray = cellhorzcat(taskNameArray);
        end % if
    end % if
    for i=1.0:length(taskNameArray)
        for j=1.0:length(this.TaskCellarray)
            if strcmp(taskNameArray{i}, this.TaskCellarray{j}.TitleID)
                if this.updateTask(j, true)
                    selectCount = plus(selectCount, 1.0);
                end % if
                break
            end % if
        end % for
    end % for
    % 32 33
    if eq(selectCount, length(taskNameArray))
        success = true;
    end % if
end % function
