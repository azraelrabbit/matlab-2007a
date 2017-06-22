function success = runTask(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    success = false;
    % 8 9
    this.deselectCheckForTaskAll;
    % 10 11
    this.StartInTaskPage = true;
    % 12 14
    % 13 14
    for i=1.0:length(this.TaskCellArray)
        if this.TaskCellArray{i}.Selected
            for j=1.0:length(this.TaskCellArray{i}.CheckIndex)
                recordSerialNum = str2num(this.TaskCellArray{i}.CheckIndex{j});
                this.updateCheckForTask(recordSerialNum, true);
            end % for
        end % if
    end % for
    % 22 23
    this.createDiagnoseStartPage(true);
    % 24 25
    success = true;
end % function
