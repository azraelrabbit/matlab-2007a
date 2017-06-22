function mdlLocation = loadModel(pathstring, modelname)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    try
        load_system(pathstring);
        mdlLocation = pathstring;
    catch
        try
            load_system(modelname);
            mdlLocation = which(modelname);
        catch
            rethrow(lasterror);
        end % try
    end % try
end % function
