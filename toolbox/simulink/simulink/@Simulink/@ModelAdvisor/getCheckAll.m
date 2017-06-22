function CheckIDArray = getCheckAll(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    CheckIDArray = {};
    % 8 9
    for i=1.0:length(this.CheckCellarray)
        CheckIDArray{plus(end, 1.0)} = this.CheckCellarray{i}.TitleID;
    end % for
end % function
