function cbkAssociateSimulink(this, sysName, rptName)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if lt(nargin, 3.0) || isempty(rptName)
        rptName = this.getCurrentRpt(true);
        % 12 14
    end % if
    % 14 16
    if isa(rptName, 'rptgen.coutline')
        rptName = rptName.RptFileName;
    end % if
    % 18 20
    if lt(nargin, 2.0) || isempty(sysName)
        if rptgen.isSimulinkLoaded
            % 21 24
            % 22 24
            sysName = gcs;
        else
            sysName = '';
        end % if
    end % if
    % 28 30
    if isempty(sysName)
        warning('Rptgen:AsssociationError', 'No current system');
    else
        if isempty(rptName)
            warning('Rptgen:AsssociationError', 'No current report');
        else
            if strcmp(rptName, '-null')
                rptName = '';
            else
                [rPath, rFile, rExt] = fileparts(rptName);
                rptName = horzcat(rFile, rExt);
            end % if
            % 41 43
            set_param(sysName, 'ReportName', rptName);
            disp(sprintf('Set system "%s" report name to "%s"', strrep(sysName, char(10.0), ' '), rptName));
            % 44 50
            % 45 50
            % 46 50
            % 47 50
            % 48 50
        end % if
    end % if
