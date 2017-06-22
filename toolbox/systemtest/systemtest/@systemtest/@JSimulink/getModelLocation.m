function mdlLocation = getModelLocation(pathstring, modelname)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    mdlLocation = which(pathstring);
    % 11 12
    if not(isempty(mdlLocation))
        return;
    end % if
    % 15 16
    mdlLocation = which(modelname, '-all');
    % 17 18
    if not(isempty(mdlLocation))
        mdlLocation = mdlLocation{1.0};
    else
        mdlLocation = '';
    end % if
end % function
