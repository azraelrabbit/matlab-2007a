function initModel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    try
        % 8 10
        % 9 10
        this.DirtyState = get_param(0.0, 'Dirty');
        this.BlockReductionOpt = this.Model.BlockReductionOpt;
        this.ConditionallyExecuteInputs = this.Model.ConditionallyExecuteInputs;
        this.ModelRates = this.Model.getSampleTimes;
        % 14 16
        % 15 16
        this.Model.BlockReductionOpt = 'off';
        this.Model.ConditionallyExecuteInputs = 'off';
        % 18 21
        % 19 21
        % 20 21
        if not(this.isModelCompiled)
            this.Model.init;
        end % if
        % 24 27
        % 25 27
        % 26 27
        set_param(0.0, 'CurrentSystem', this.ModelName);
        % 28 32
        % 29 32
        % 30 32
        % 31 32
        graphs = getGraph(this.Model);
        % 33 35
        % 34 35
        this.StartNode = this.findStartNode(graphs(2.0));
    catch
        % 37 38
        this.termModel;
        rethrow(lasterror);
    end % try
end % function
