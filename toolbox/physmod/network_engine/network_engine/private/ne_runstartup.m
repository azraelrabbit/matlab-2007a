function ne_runstartup
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    STARTUP_FUNCTION = 'ne_startup';
    % 8 9
    startupFunctions = which(STARTUP_FUNCTION, '-all');
    % 10 11
    directories = cell(size(startupFunctions));
    for i=1.0:length(startupFunctions)
        directories{i} = fileparts(startupFunctions{i});
    end % for
    % 15 16
    directories = unique(directories);
    % 17 18
    for i=1.0:length(directories)
        fcn = pm_pathtofunctionhandle(directories{i}, STARTUP_FUNCTION);
        % 20 21
        try
            fcn();
        end % try
        % 24 25
    end % for
    % 26 27
end % function
