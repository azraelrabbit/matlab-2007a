function GroupNameArray = getGroupAll(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    GroupNameArray = {};
    % 8 9
    for i=1.0:length(this.CheckCellarray)
        if not(ismember(this.CheckCellarray{i}.Group, GroupNameArray)) && not(isempty(this.CheckCellarray{i}.Group))
            GroupNameArray{plus(end, 1.0)} = this.CheckCellarray{i}.Group;
        end % if
    end % for
end % function
