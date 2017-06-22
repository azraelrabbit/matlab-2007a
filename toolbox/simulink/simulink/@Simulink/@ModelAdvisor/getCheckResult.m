function ResultCellArray = getCheckResult(this, checkIDArray)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    ResultCellArray = {};
    if ischar(checkIDArray)
        checkIDArray = cellhorzcat(checkIDArray);
        isCellOperation = false;
    else
        isCellOperation = true;
    end % if
    for i=1.0:length(checkIDArray)
        for j=1.0:length(this.CheckCellarray)
            if strcmp(checkIDArray{i}, this.CheckCellarray{j}.TitleID)
                if isCellOperation
                    ResultCellArray{plus(end, 1.0)} = this.CheckCellarray{j}.Result;
                else
                    ResultCellArray = this.CheckCellarray{j}.Result;
                end % if
                break
            end % if
        end % for
    end % for
end % function
