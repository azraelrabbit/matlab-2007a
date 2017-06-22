function propertyCallback_editingMode(this, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    owner = eventData.AffectedObject;
    event = eventData.Type;
    % 10 11
    switch event
    case 'PropertyPostSet'
        % 13 14
        dirtyModel = ssc_private('ssc_mark_model_dirty');
        dirtyModel(owner.getBlockDiagram);
        % 16 20
        % 17 20
        % 18 20
        % 19 20
        hModel = owner.getBlockDiagram;
        pmOpenDialogs = this.getOpenDialogs(hModel);
        for idx=1.0:numel(pmOpenDialogs)
            this.prepareToOpenDialog(pmOpenDialogs(idx).Block);
            pmOpenDialogs(idx).Dialog.refresh();
        end % for
    otherwise
        % 27 29
        % 28 29
        configData = RunTimeModule_config;
        pm_error(configData.Error.UnexpectedCallback_templ_msgid, event, eventData.Source.Name);
        % 31 32
    end % switch
end % function
