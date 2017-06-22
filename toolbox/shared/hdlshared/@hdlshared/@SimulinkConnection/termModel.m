function termModel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(this.Model))
        % 8 10
        % 9 10
        if this.isModelCompiled
            term(this.Model);
        end % if
        % 13 15
        % 14 15
        this.Model.BlockReductionOpt = this.BlockReductionOpt;
        this.Model.ConditionallyExecuteInputs = this.ConditionallyExecuteInputs;
        set_param(0.0, 'Dirty', this.DirtyState);
    end % if
end % function
