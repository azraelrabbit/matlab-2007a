function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    isHalt = logical(1);
    % 9 11
    if c.isPrompt
        % 11 13
        try
            % 13 16
            % 14 16
            beep
        end % try
        % 17 19
        btnName = questdlg(c.PromptString, 'Component - Stop Report Generation', c.HaltString, c.ContString, c.ContString);
        % 19 22
        % 20 22
        if strcmp(btnName, c.ContString)
            isHalt = logical(0);
        end
    end
    % 25 27
    if isHalt
        r = rptgen.appdata_rg;
        r.HaltGenerate = logical(1);
        % 29 31
        out = createComment(r.CurrentDocument, sprintf('Report Generation halted by crg_halt_gen at %s', datestr(now)));
        % 31 33
        status(c, 'Generation halted by component', 3.0);
    else
        status(c, 'Generation not halted by component', 6.0);
        out = [];
    end
end
