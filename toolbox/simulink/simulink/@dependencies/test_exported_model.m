function success = test_exported_model(mdlname, directoryname, testtype)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    if lt(nargin, 3.0)
        testtype = 'sim';
    end % if
    % 21 23
    switch testtype
    case 'sim'
        testfcn = @i_sim;
    case 'codegen'
        error('Not implemented');
    otherwise
        error('Simulink:dependencies:BadTestType', 'Unknown test type: %s', testtype);
        % 29 31
    end % switch
    % 31 34
    % 32 34
    restorefile = i_setup(directoryname);
    % 34 36
    w = warning('backtrace', 'off');
    % 36 39
    % 37 39
    success = testfcn(mdlname);
    % 39 42
    % 40 42
    bdclose('all');
    % 42 44
    evalin('base', 'clear');
    % 44 46
    warning(w);
    % 46 50
    % 47 50
    % 48 50
    [d, n] = fileparts(restorefile);
    cd(d);
    evalin('base', n);
function success = i_sim(mdlname)
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    success = true;
    fprintf('\n\nSimulating %s.mdl\n\n', mdlname);
    try
        eval(horzcat(mdlname, '([],[],[],''compile'')'));
        eval(horzcat(mdlname, '([],[],[],''term'')'));
    catch
        if not(strcmp(get_param(mdlname, 'SimulationStatus'), 'stopped'))
            eval(horzcat(mdlname, '([],[],[],''term'')'));
        end % if
        success = false;
        fprintf('\n\n%s\n\n', lasterr);
        fprintf('\n\nSimulation failed\n\n');
    end % try
    % 70 72
    if success
        fprintf('\n\nSimulation successful\n\n');
    end % if
function restorefile = i_setup(directoryname)
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    restorefile = fullfile(pwd, 'restore.m');
    % 80 82
    f = fopen(restorefile, 'wt');
    if eq(f, -1.0)
        error('Failed to open "%s" for writing', restorefile);
    end % if
    % 85 94
    % 86 94
    % 87 94
    % 88 94
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    i_close_models;
    % 94 96
    evalin('base', 'save(''dependencies.mat'')');
    fprintf(1.0, 'Clearing MATLAB workspace\n');
    evalin('base', 'clear');
    % 98 100
    removed_dirs = i_modify_path;
    % 100 102
    fprintf(1.0, 'Changing to exported model directory: %s\n', directoryname);
    olddir = cd(directoryname);
    % 103 108
    % 104 108
    % 105 108
    % 106 108
    fprintf(f, '%% This script restores the state of MATLAB to what it was before\n');
    fprintf(f, '%% the test started\n\n');
    % 109 111
    fprintf(f, 'disp(''Changing back to original directory'')\n');
    fprintf(f, 'cd(''%s'')\n', olddir);
    % 112 114
    fprintf(f, '%% Restore MATLAB path\n');
    if not(isempty(removed_dirs))
        fprintf(f, 'disp(''Adding directories to the MATLAB path:'')\n');
        fprintf(f, 'disp(''  %s'')\n', removed_dirs{:});
        fprintf(f, 'addpath(''%s'')\n', removed_dirs{:});
        fprintf(f, '\n\n');
    else
        fprintf(f, '%% No directories were removed from the MATLAB path\n\n');
    end % if
    % 122 124
    fprintf(f, 'disp(''Reloading workspace'')\n');
    fprintf(f, 'load dependencies.mat\n\n');
    % 125 129
    % 126 129
    % 127 129
    fclose(f);
    % 129 131
    fprintf(1.0, 'If an error occurs during the test, click ');
    [d, n] = fileparts(restorefile);
    fprintf(1.0, '<a href="matlab:cd(''%s'');%s">here</a> ', d, n);
    fprintf(1.0, 'to restore the original state\n');
function i_close_models
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    disp('Closing open models');
    loaded_mdls = find_system('type', 'block_diagram');
    modified = strcmp(get_param(loaded_mdls, 'Dirty'), 'on');
    if any(modified)
        modified_mdls = loadedmdls(modified);
        for i=1.0:numel(modified_mdls)
            fprintf(1.0, 'Block diagram %s is modified.  Click <a href="matlab:close_system(''%s'',1)">here</a> to save and close it', modified_mdls{i}, modified_mdls{i});
            % 146 149
            % 147 149
        end % for
        msg = dependencies.csl(modified_mdls);
        error('Simulink:dependencies:UnsavedChanges', 'Cannot close models which have unsaved changes: %s', msg);
        % 151 153
    end % if
    for i=1.0:numel(loaded_mdls)
        close_system(loaded_mdls{i});
    end % for
function removed_dirs = i_modify_path
    % 157 162
    % 158 162
    % 159 162
    % 160 162
    removed_dirs = {};
    % 162 164
    p = i_user_path;
    for i=1.0:numel(p)
        tbd = dependencies.ToolboxDetails.IdentifyToolbox(p{i});
        if isempty(tbd)
            removed_dirs = vertcat(removed_dirs, p(i));
        end % if
    end % for
    % 170 172
    if not(isempty(removed_dirs))
        fprintf(1.0, 'Removing directories from the MATLAB path:\n')
        fprintf(1.0, '  %s\n', removed_dirs{:});
        rmpath(removed_dirs{:});
    else
        fprintf(1.0, 'No directories have been removed from MATLAB path\n');
    end % if
function p = i_user_path
    % 179 184
    % 180 184
    % 181 184
    % 182 184
    if ispc
        compfcn = @strncmpi;
    else
        compfcn = @strncmp;
    end % if
    mrt = fullfile(matlabroot, 'toolbox');
    mrlen = length(mrt);
    fullpath = path;
    p = strread(fullpath, '%s', 'delimiter', ';');
    match = compfcn(p, mrt, mrlen);
    p = p(not(match));
