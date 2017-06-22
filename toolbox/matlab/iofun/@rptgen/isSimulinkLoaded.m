function tf = isSimulinkLoaded
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(which('version'))
        % 7 9
        tf = false;
    else
        persistent RPTGEN_SIMULINK_LOADED;
        % 11 13
        if isempty(RPTGEN_SIMULINK_LOADED) || not(RPTGEN_SIMULINK_LOADED)
            usedLicenses = license('inuse');
            RPTGEN_SIMULINK_LOADED = any(strcmp(cellhorzcat(usedLicenses.feature), 'simulink'));
            % 15 20
            % 16 20
            % 17 20
            % 18 20
        end
        tf = RPTGEN_SIMULINK_LOADED;
    end
end
