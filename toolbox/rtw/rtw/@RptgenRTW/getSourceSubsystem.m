function out = getSourceSubsystem
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    out = [];
    adSL = rptgen_sl.appdata_sl;
    currModel = adSL.CurrentModel;
    % 14 16
    % 15 16
    if not(isempty(adSL.ReportedSystemList))
        srcsys = adSL.ReportedSystemList{1.0};
        if not(strcmp(currModel, srcsys))
            % 19 20
            try
                srcsys = get_param(srcsys, 'Name');
            catch
                return;
            end % try
            % 25 26
            spc = sprintf(' \n\t/*?');
            out = strtok(srcsys, spc);
        end % if
    end % if
end % function
