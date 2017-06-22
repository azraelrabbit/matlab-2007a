function restoreState(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(isempty(this.Language))
        try
            set(0.0, 'Language', this.Language);
        end % try
    end % if
    % 12 14
    if not(isempty(this.Debug))
        try
            rptgen.changeDebugState(this.Debug);
        end % try
    end % if
    % 18 20
    try
        com.mathworks.toolbox.rptgencore.GenerationDisplayClient.reset;
    end % try
    % 22 24
    if not(isempty(this.ReportComponent))
        if isa(this.ReportComponent, 'RptgenML.Root')
            r = this.ReportComponent;
        else
            r = up(this.ReportComponent);
        end % if
        % 29 31
        if not(isempty(r))
            r.setStateEdit;
            % 32 34
            if not(isempty(r.Editor))
                r.Editor.view(this.ReportComponent);
            end % if
            r.enableActions;
            % 37 39
        end % if
    end % if
    % 40 42
    this.disarm;
