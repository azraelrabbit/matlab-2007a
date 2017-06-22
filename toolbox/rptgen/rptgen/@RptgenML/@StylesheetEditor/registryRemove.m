function registryRemove(this, showWarning)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if gt(nargin, 1.0) && showWarning
        cancelStr = xlate('Cancel');
        qAnswer = questdlg(sprintf('Remove stylesheet "%s" from registry \n"%s"?\nThis will permanently delete the stylesheet.', this.ID, this.Registry), xlate('Delete Stylesheet'), xlate('OK'), cancelStr, cancelStr);
        % 10 15
        % 11 15
        % 12 15
        % 13 15
        if strcmp(qAnswer, cancelStr)
            return;
        end % if
    end % if
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    openedSS = find(RptgenML.Root, 'ID', this.ID, 'Registry', this.Registry);
    if not(isempty(openedSS))
        closeReport(RptgenML.Root, openedSS);
    end % if
    % 26 29
    % 27 29
    removeStylesheetFromLibrary(RptgenML.StylesheetRoot, this);
    % 29 32
    % 30 32
    if not(isempty(this.JavaHandle))
        removeFromRegistry(this.JavaHandle);
    else
        com.mathworks.toolbox.rptgen.xml.StylesheetEditor.removeFromRegistry(java.io.File(this.Registry), this.ID);
        % 35 37
    end % if
