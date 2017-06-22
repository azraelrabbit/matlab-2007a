function manifestcallback(action, sys)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if lt(nargin, 2.0) || isempty(sys)
        sys = bdroot;
    end % if
    % 15 16
    if isempty(sys)
        error('Simulink:dependencies:NoSystem', 'No system specified and no model open');
        % 18 19
    end % if
    % 20 21
    switch action
    case 'generate'
        md = dependencies.ModelDependencies;
        md.MDLName = sys;
        md.pDialogGenerate('get', true);
    case 'additionalfiles'
        md = dependencies.ModelDependencies;
        md.MDLName = sys;
        % 29 31
        % 30 31
        md.pDialogChoose('get', true);
    case 'compare'
        md = dependencies.ModelDependencies;
        md.MDLName = sys;
        md.pDialogCompare('get', true);
    case 'export'
        md = dependencies.ModelDependencies;
        md.MDLName = sys;
        md.pDialogExport('get', true);
    otherwise
        error('Simulink:dependencies:BadAction', 'Unknown action: %s', action);
        % 42 43
    end % switch
end % function
