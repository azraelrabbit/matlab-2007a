function TaskIDArray = getTaskAll(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    TaskIDArray = {};
    % 8 9
    for i=1.0:length(this.TaskCellarray)
        TaskIDArray{plus(end, 1.0)} = this.TaskCellarray{i}.TitleID;
    end % for
end % function
