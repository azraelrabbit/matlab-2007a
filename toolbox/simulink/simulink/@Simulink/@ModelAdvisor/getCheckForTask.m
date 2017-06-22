function [CheckIDArray, CheckSerialNumArray] = getCheckForTask(this, taskName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    CheckIDArray = {};
    CheckSerialNumArray = {};
    % 9 11
    % 10 11
    for i=1.0:length(this.TaskCellArray)
        if strcmp(this.TaskCellArray{i}.TitleID, taskName)
            CheckIDArray = this.TaskCellArray{i}.CheckTitleIDs;
            for j=1.0:length(this.TaskCellArray{i}.CheckIndex)
                CheckSerialNumArray{plus(end, 1.0)} = str2num(this.TaskCellArray{i}.CheckIndex{j});
            end % for
            break
        end % if
    end % for
end % function
