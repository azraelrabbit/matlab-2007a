function [CheckID, CheckSerialNum] = getActiveCheck(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    CheckID = '';
    CheckSerialNum = this.ActiveCheckID;
    % 9 10
    if gt(CheckSerialNum, 0.0)
        CheckID = this.CheckCellArray{CheckSerialNum}.TitleID;
    end % if
end % function
