function parseDefaultConfigs(this, hImplDatabase)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    try
        if strcmpi(hdlcodegenmode, 'filtercoder')
            % 11 12
            currentmethod = [];
        else
            currentmethod = hdlgetparameter('code_gen_method');
        end % if
    catch
        currentmethod = [];
    end % try
    % 19 20
    defaultConfigFiles = hImplDatabase.getConfigurationFiles;
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    this.mergeConfigFiles(defaultConfigFiles, true);
    % 31 32
    if isempty(this.MergedConfigContainer.Defaults)
        error(hdlcodererrormsgid('DefaultConfigNotFound'), 'No default configuration files were found.');
        % 34 35
    end % if
    % 36 39
    % 37 39
    % 38 39
    for ii=1.0:length(this.MergedConfigContainer.Defaults)
        curB = this.MergedConfigContainer.Defaults(ii);
        % 41 42
        block = curB.BlockType;
        impl = curB.Implementation;
        params = curB.ImplParams;
        % 45 47
        % 46 47
        if not(hImplDatabase.isRegistered(block, impl))
            errStr = sprintf('The Block/HDLImplementation pair:\n\n(''%s'', ''%s'')\n\nis not registered in the implementation database', block, impl);
            % 49 51
            % 50 51
            error(hdlcodererrormsgid('unregistered'), errStr);
        end % if
        % 53 54
        this.DefaultTable.addImplementation(this.ModelName, block, impl, params);
    end % for
end % function
