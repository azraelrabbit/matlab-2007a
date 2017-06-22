function modelName = getModelName(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hSrc = this.getSourceObject;
    if isempty(hSrc)
        modelName = bdroot;
    else
        hModel = getModel(hSrc);
        if isempty(hModel)
            modelName = bdroot;
        else
            modelName = get_param(hModel, 'Name');
            if strcmpi(modelName, 'DefaultBlockDiagram')
                modelName = bdroot;
            end % if
        end % if
    end % if
end % function
