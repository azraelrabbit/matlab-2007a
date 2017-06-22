function fileName = doSave(this, isSaveAs)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    fileName = '';
    % 10 12
    if lt(nargin, 2.0) || isempty(isSaveAs)
        isSaveAs = false;
    end
    % 14 16
    if not(isSaveAs)
        isSaveAs = locWarnOnSave(this, false);
        if isempty(isSaveAs)
            return
        end
    end
    % 21 23
    while isSaveAs
        if isempty(this.RptFileName)
            startFile = 'Unnamed.rpt';
        else
            startFile = this.RptFileName;
        end
        % 28 30
        [dlgFile, dlgPath] = uiputfile(vertcat(cellhorzcat('*.rpt', xlate('Report Generator Files (*.rpt)')), cellhorzcat('*.*', xlate('All Files (*.*)'))), xlate('Save Report File as'), startFile);
        % 30 36
        % 31 36
        % 32 36
        % 33 36
        % 34 36
        if isequal(dlgFile, 0.0) || isequal(dlgPath, 0.0)
            return
        else
            this.RptFileName = fullfile(dlgPath, dlgFile);
        end
        % 40 42
        isSaveAs = locWarnOnSave(this, false);
        if isempty(isSaveAs)
            return
        end
    end % while
    % 46 48
    try
        fileName = this.save;
    catch
        fileName = '';
        warndlg(lasterr, xlate('Save Error'), 'replace');
    end % try
    % 53 55
    r = this.up;
    if isa(r, 'RptgenML.Root')
        thisLibRpt = r.findRptByName(this.RptFileName, true, false);
        if not(isempty(thisLibRpt))
            thisLibRpt.Description = this.Description;
        end
        % 60 62
        enableActions(r);
        % 62 65
        % 63 65
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('HierarchyChangedEvent', this);
    end
end
function isSaveAs = locWarnOnSave(currRpt, isSaveAs)
    % 69 72
    % 70 72
    if isempty(fileparts(currRpt.RptFileName))
        isSaveAs = true;
    else
        if isa(currRpt, 'RptgenML.CReport') && strcmpi(currRpt.RptFileName, currRpt.WarnOnSaveFilename)
            % 75 77
            qResult = questdlg(xlate('Changing this report will make it unreadable to users who do not have the Report Generator v2.0 or higher.'), xlate('Overwrite Warning'), xlate('Save anyway'), xlate('Save as...'), xlate('Cancel'), xlate('Cancel'));
            % 77 83
            % 78 83
            % 79 83
            % 80 83
            % 81 83
            switch qResult
            case xlate('Save anyway')
                currRpt.WarnOnSaveFilename = '';
                isSaveAs = false;
            case xlate('Save as...')
                isSaveAs = true;
            otherwise
                isSaveAs = [];
            end
        end
    end
end
