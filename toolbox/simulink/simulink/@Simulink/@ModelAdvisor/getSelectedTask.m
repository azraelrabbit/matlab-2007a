function [TaskIDArray, TaskSerialNumArray] = getSelectedTask(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    TaskIDArray = {};
    TaskSerialNumArray = {};
    % 9 10
    for i=1.0:length(this.TaskCellarray)
        if this.TaskCellarray{i}.Selected
            TaskIDArray{plus(end, 1.0)} = this.TaskCellarray{i}.TitleID;
            TaskSerialNumArray{plus(end, 1.0)} = i;
        end % if
    end % for
end % function
