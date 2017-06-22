function res = isUnderDeactiveWorkflow(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    res = false;
    % 8 9
    if not(this.Selected)
        res = true;
        return;
    else
        if isa(this.up, 'Simulink.TaskAdvisor')
            res = this.up.isUnderDeactiveWorkflow;
        end % if
    end % if
end % function
