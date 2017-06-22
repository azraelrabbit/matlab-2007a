function [CheckIDArray, CheckSerialNumArray] = getCheckForGroup(this, groupNameArray)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    CheckIDArray = {};
    CheckSerialNumArray = {};
    if ischar(groupNameArray)
        % 10 11
        groupNameArray = cellhorzcat(groupNameArray);
    end % if
    % 13 14
    for i=1.0:length(this.CheckCellarray)
        if ismember(this.CheckCellarray{i}.Group, groupNameArray)
            CheckIDArray{plus(end, 1.0)} = this.CheckCellarray{i}.TitleID;
            CheckSerialNumArray{plus(end, 1.0)} = i;
        end % if
    end % for
end % function
