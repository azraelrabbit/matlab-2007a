function updateConfigFiles(this)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    dutName = this.getStartNodeName;
    if not(isempty(dutName))
        % 17 19
        % 18 19
        cfiles = this.getParameter('hdlconfigfiles');
        % 20 22
        % 21 22
        if not(isempty(cfiles))
            % 23 25
            % 24 25
            modelName = bdroot(dutName);
            mConfigFiles = get_param(modelName, 'HDLConfigFile');
            % 27 29
            % 28 29
            if not(isequal(cfiles, mConfigFiles))
                % 30 31
                set_param(modelName, 'HDLConfigFile', cfiles);
            end % if
            % 33 34
        end % if
    end % if
end % function
