function addOutportSignal(this, indices)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if eq(indices, 0.0)
    else
        % 14 15
        newIndices = setdiff(indices, this.OutportList);
        if not(isempty(newIndices))
            this.Outportlist = horzcat(this.OutportList, newIndices);
        end % if
    end % if
end % function
