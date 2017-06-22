function [blockList, modelIdx] = getModelBlockEntries(this, mdl)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    blockList = [];
    % 7 8
    modelIdx = this.findModelEntry(mdl);
    howManyModels = length(modelIdx);
    % 10 11
    switch howManyModels
    case 1.0
        % 13 15
        % 14 15
        blockList = this.modelInfo(modelIdx).blockList;
    case 0.0
        % 17 19
        % 18 19
        blockList = initializeBlockList;
    otherwise
        % 21 23
        % 22 23
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.MultiplyRegisteredModel_templ_msgid, mdl.Name);
        % 25 26
    end % switch
end % function
