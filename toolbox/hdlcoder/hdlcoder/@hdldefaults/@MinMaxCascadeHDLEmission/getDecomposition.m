function decomposition = getDecomposition(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    decomposition = 1.0;
    % 11 12
    controlFileParam = this.getControlFileParam('decomposition');
    % 13 14
    if not(isempty(controlFileParam))
        if iscell(controlFileParam)
            decomposition = controlFileParam{end};
        end % if
    end % if
end % function
