function [CheckIDArray, CheckSerialNumArray] = getSelectedCheck(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    CheckIDArray = {};
    CheckSerialNumArray = {};
    % 9 10
    for i=1.0:length(this.CheckCellarray)
        if this.CheckCellarray{i}.Selected
            CheckIDArray{plus(end, 1.0)} = this.CheckCellarray{i}.TitleID;
            CheckSerialNumArray{plus(end, 1.0)} = i;
        end % if
    end % for
end % function
