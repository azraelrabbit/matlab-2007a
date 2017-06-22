function success = init(this, system)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this.stage = 'init';
    success = false;
    % 9 10
    if ischar(system)
        % 11 12
        system = fliplr(system);
        if strncmpi(system, 'ldm.', 4.0)
            system = system(5.0:end);
        end % if
        system = fliplr(system);
    end % if
    % 18 20
    % 19 20
    load_system(getfullname(system));
    % 21 22
    if isLibrary(system)
        DAStudio.error('Simulink:tools:MANotWorkOnLibrary');
    end % if
    try
        if not(usejava('swing')) && not(this.NOBROWSER)
            DAStudio.error('Simulink:tools:MARequiresJava');
        end % if
        % 29 31
        % 30 31
        try
            get_param(system, 'handle');
        catch
            load_system(system);
        end % try
        % 36 38
        % 37 38
        this.AtticData = {};
        % 39 42
        % 40 42
        % 41 42
        cmdRoot = horzcat(matlabroot, filesep, 'toolbox', filesep, 'simulink', filesep, 'simulink', filesep, 'modeladvisor');
        this.AtticData.cmdRoot = cmdRoot;
        % 44 47
        % 45 47
        % 46 47
        this.System = system;
        % 48 49
        this.AtticData.Browser = 'java';
        this.AtticData.ShowFullName = true;
        % 51 52
        this.System = system;
        % 53 55
        % 54 55
        this.AtticData.DiagnoseStartPage = horzcat(this.getWorkDir, filesep, 'model_diagnose.html');
        % 56 57
        if exist(this.AtticData.DiagnoseStartPage, 'file')
            if gt(rtwprivate('cmpTimeFlag', this.AtticData.DiagnoseStartPage, which(getfullname(bdroot(system)))), 0.0)
                % 59 60
                if this.ShowWarnDialog
                    warndlg('WARNING: The model appears to be newer than the report. Consider running the report again.');
                end % if
            end % if
            % 64 65
            this.createDiagnoseStartPage(false);
        else
            this.createDiagnoseStartPage(true, 'FirstTime');
        end % if
        success = true;
    catch
        success = false;
        rethrow(lasterror);
    end % try
end % function
function output = isLibrary(system)
    % 76 80
    % 77 80
    % 78 80
    % 79 80
    system = bdroot(system);
    fp = get_param(system, 'ObjectParameters');
    if isfield(fp, 'BlockDiagramType')
        if strcmpi(get_param(system, 'BlockDiagramType'), 'library')
            output = 1.0;
        else
            output = 0.0;
        end % if
    else
        % 89 90
        output = 1.0;
    end % if
end % function
