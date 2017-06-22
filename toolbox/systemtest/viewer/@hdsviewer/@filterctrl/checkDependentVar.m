function checkDependentVar(this, y)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(all(ismember(y, fieldnames(this.dataset.variable))))
        error('All the Y/Z variables have to be results');
    end % if
end % function
