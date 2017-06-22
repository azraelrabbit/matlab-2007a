function mdladvObj = getModelAdvisor(system, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if gt(nargin, 1.0) && strcmpi(varargin{1.0}, 'new')
        newContext = true;
    else
        newContext = false;
    end % if
    % 11 13
    if ischar(system)
        % 13 15
        system = fliplr(system);
        if strncmpi(system, 'ldm.', 4.0)
            system = system(5.0:end);
        end % if
        system = fliplr(system);
    end % if
    % 20 22
    if isLibrary(system)
        DAStudio.error('Simulink:tools:MANotWorkOnLibrary');
    end % if
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    if not(newContext)
        activeMAObj = Simulink.ModelAdvisor.getActiveModelAdvisorObj;
        if not(isempty(activeMAObj))
            try
                activeSysName = getfullname(activeMAObj.System);
            catch
                % 36 39
                % 37 39
                activeSysName = getfullname(system);
            end % try
            if not(strcmp(activeSysName, getfullname(system)))
                DAStudio.error('Simulink:tools:MAErrorChangeWorkSystem');
            end % if
        end % if
    end % if
    % 45 47
    mdlObj = get_param(bdroot(system), 'Object');
    mdladvObj = mdlObj.getModelAdvisorObj;
    Simulink.ModelAdvisor.getActiveModelAdvisorObj(mdladvObj);
    % 49 52
    % 50 52
    if isempty(mdladvObj.CheckCellArray) || not(strcmp(getfullname(mdladvObj.System), getfullname(system))) || not(exist(mdladvObj.AtticData.DiagnoseStartPage, 'file'))
        % 52 54
        mdladvObj.init(system);
    end % if
function output = isLibrary(system)
    % 56 58
    system = bdroot(system);
    fp = get_param(system, 'ObjectParameters');
    if isfield(fp, 'BlockDiagramType')
        if strcmpi(get_param(system, 'BlockDiagramType'), 'library')
            output = 1.0;
        else
            output = 0.0;
        end % if
    else
        % 66 68
        output = 1.0;
    end % if
