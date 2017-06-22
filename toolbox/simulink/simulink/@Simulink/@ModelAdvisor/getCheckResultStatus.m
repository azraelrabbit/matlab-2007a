function checkStatusArray = getCheckResultStatus(this, checkArray)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    checkStatusArray = {};
    if ischar(checkArray)
        % 9 10
        checkArray = cellhorzcat(checkArray);
        isCellOperation = false;
    else
        isCellOperation = true;
    end % if
    % 15 16
    for i=1.0:length(checkArray)
        for j=1.0:length(this.CheckCellArray)
            if strcmp(this.CheckCellArray{j}.TitleID, checkArray{i})
                if isCellOperation
                    checkStatusArray{plus(end, 1.0)} = this.CheckCellArray{j}.Success;
                else
                    checkStatusArray = this.CheckCellArray{j}.Success;
                end % if
                break
            end % if
        end % for
    end % for
end % function
