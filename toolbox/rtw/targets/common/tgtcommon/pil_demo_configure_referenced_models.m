function pil_demo_configure_referenced_models(thisModel, thisConfigSet, models, configSets)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    error(nargchk(4.0, 4.0, nargin, 'struct'));
    % 18 19
    if ne(length(models), length(configSets))
        error('List of models and configuration sets must be the same length.');
    end % if
    % 22 24
    % 23 24
    load_system(thisModel);
    setActiveConfigSet(thisModel, thisConfigSet);
    % 26 28
    % 27 28
    changedConfigSets = false;
    % 29 30
    for i=1.0:length(models)
        model = models{i};
        configSet = configSets{i};
        h = load_system(model);
        acs = getActiveConfigSet(h);
        if not(strcmp(acs.Name, configSet))
            % 36 39
            % 37 39
            % 38 39
            fpath = which(model);
            [success, message, messageid] = fileattrib(fpath);
            if not(success)
                % 42 43
                error(messageid, message);
            end % if
            if ne(message.UserWrite, 1.0)
                error('File %s must be writeable to run this demo. Please either change its file attributes or make a writeable copy in your working directory.', fpath);
                % 47 49
                % 48 49
            end % if
            setActiveConfigSet(h, configSet);
            changedConfigSets = true;
            save_system(h);
        end % if
    end % for
    % 55 56
    if changedConfigSets
        % 57 60
        % 58 60
        % 59 60
        sharedUtils = fullfile(pwd, 'slprj', 'sim', '_sharedutils', '*');
        delete(sharedUtils);
    end % if
end % function
