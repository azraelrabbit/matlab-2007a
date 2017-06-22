function activateConfigSet(this, blockDiagram)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    getConfigSet = ssc_private('ssc_get_configset');
    newSimscapeCC = getConfigSet(blockDiagram);
    oldSimscapeCC = this.modelRegistry.getAndClearPreswitchCC(blockDiagram);
    % 10 14
    % 11 14
    % 12 14
    if ~(isempty(oldSimscapeCC) || isempty(newSimscapeCC))
        % 14 18
        % 15 18
        % 16 18
        oldMode = this.getCcEditingMode(oldSimscapeCC);
        newMode = this.getCcEditingMode(newSimscapeCC);
        % 19 21
        try
            % 21 23
            this.switchEditingMode(blockDiagram, oldMode, newMode);
        catch
            % 24 28
            % 25 28
            % 26 28
            oldSimscapeCC.getParent.activate;
            rethrow(lasterror)
            % 29 31
        end % try
    else
        % 32 38
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        this.modelRegistry.createModelEntry(blockDiagram);
        % 38 40
    end
end
