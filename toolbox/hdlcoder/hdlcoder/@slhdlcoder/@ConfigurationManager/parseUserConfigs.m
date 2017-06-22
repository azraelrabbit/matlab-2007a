function parseUserConfigs(this, hImplDatabase, configFiles)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    this.mergeConfigFiles(configFiles, false);
    % 6 8
    config = this.MergedConfigContainer.Statements;
    % 8 10
    for i=1.0:length(config)
        % 10 12
        pathStr = config(i).Scope;
        % 12 15
        % 13 15
        [isValid, isGlobal, isHereDown, isHereOnly, isBlock, slpath] = this.analyzePath(pathStr);
        % 15 19
        % 16 19
        % 17 19
        if not(isValid)
            continue;
        end
        % 21 24
        % 22 24
        block = config(i).BlockType;
        impl = config(i).Implementation;
        params = config(i).ImplParams;
        % 26 29
        % 27 29
        if not(hImplDatabase.isRegistered(block, impl))
            errStr = sprintf('The Block/HDLImplementation pair:\n\n(''%s'', ''%s'')\n\nis not registered in the implementation database', block, impl);
            % 30 33
            % 31 33
            error(hdlcodererrormsgid('unregistered'), errStr);
        end
        % 34 36
        if isGlobal
            % 36 38
            if isBlock
                error(hdlcodererrormsgid('configerror'), 'Configuration parse error: cannot be both global and block')
                % 39 41
            end
            % 41 43
            if not(strcmp(slpath, this.ModelName))
                error(hdlcodererrormsgid('configerror'), 'Configuration parse error: expected slpath to be model name')
                % 44 46
            end
            % 46 48
            if isHereDown
                % 48 51
                % 49 51
                this.HereDownNetworkTable.addImplementation(slpath, block, impl, params);
            else
                if isHereOnly
                    % 53 56
                    % 54 56
                    this.HereOnlyNetworkTable.addImplementation(slpath, block, impl, params);
                else
                    error(hdlcodererrormsgid('configerror'), 'Configuration parse error: ''/'' and ''modelname'' are not valid configuration paths');
                    % 58 61
                    % 59 61
                end
            end
        else
            % 63 65
            if isempty(slpath)
                warning(sprintf('Configuration parse issue: empty path specified for non-global configuration'));
                % 66 68
                continue;
            end
            % 69 71
            if isBlock
                % 71 79
                % 72 79
                % 73 79
                % 74 79
                % 75 79
                % 76 79
                % 77 79
                this.HereOnlyComponentTable.addImplementation(slpath, block, impl, params);
            else
                % 80 82
                if isHereDown
                    % 82 85
                    % 83 85
                    this.HereDownNetworkTable.addImplementation(slpath, block, impl, params);
                else
                    if isHereOnly
                        % 87 89
                        this.HereOnlyNetworkTable.addImplementation(slpath, block, impl, params);
                    else
                        % 90 92
                        this.FrontEndStopTable.addImplementation(slpath, block, impl, params);
                        % 92 94
                    end
                end
            end
        end
    end % for
end
