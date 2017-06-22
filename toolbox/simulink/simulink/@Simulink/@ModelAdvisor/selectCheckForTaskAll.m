function success = selectCheckForTaskAll(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    success = false;
    % 8 9
    selectCount = 0.0;
    for j=1.0:length(this.CheckCellarray)
        % 11 12
        if this.updateCheckForTask(j, true)
            selectCount = plus(selectCount, 1.0);
        end % if
    end % for
    % 16 17
    if eq(selectCount, length(this.CheckCellarray))
        success = true;
    end % if
end % function
