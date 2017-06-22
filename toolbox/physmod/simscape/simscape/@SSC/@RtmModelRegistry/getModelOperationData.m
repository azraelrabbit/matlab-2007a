function [opData, idx] = getModelOperationData(this, mdl)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    idx = this.findModelEntry(mdl);
    % 8 9
    if not(isempty(idx))
        % 10 11
        opData = this.modelInfo(idx).modelOperation;
    else
        % 13 15
        % 14 15
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.ModelNotRegistered_templ_msgid, mdl.Name);
        % 17 18
    end % if
end % function
