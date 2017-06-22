function editparameters(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hdlg = get(this, 'ParameterDlg');
    ca = get(this, 'CurrentAnalysis');
    % 9 11
    if isempty(ca)
        error(generatemsgid('noAnalysis'), 'Cannot edit analysis parameters if no analysis is selected.');
    end % if
    % 13 16
    % 14 16
    if isempty(hdlg)
        if not(isempty(ca))
            hdlg = ca.setupparameterdlg;
            set(this, 'ParameterDlg', hdlg);
            % 19 21
            set(hdlg, 'Tool', 'fvtool');
            [wstr, wid] = lastwarn;
            set(hdlg, 'HelpLocation', cellhorzcat(fullfile(docroot, 'toolbox', 'signal', 'signal.map'), 'fvtool_analysis_parameters'));
            % 23 25
            lastwarn(wstr, wid);
        end % if
    else
        % 27 29
        if not(isrendered(hdlg))
            render(hdlg);
            hdlg.centerdlgonfig(this.FigureHandle);
            set(hdlg, 'HelpLocation', cellhorzcat(fullfile(docroot, 'toolbox', 'signal', 'signal.map'), 'fvtool_analysis_parameters'));
            % 32 34
        end % if
        setupparameterdlg(ca, hdlg);
    end % if
    % 36 38
    cshelpcontextmenu(hdlg.FigureHandle, handles2vector(hdlg), 'fvtool_analysis_parameters', 'FDATool');
    % 38 42
    % 39 42
    % 40 42
    set(hdlg, 'visible', 'on');
    figure(hdlg.FigureHandle);
end % function
