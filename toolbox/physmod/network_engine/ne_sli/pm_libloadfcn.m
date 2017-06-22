function pm_libloadfcn(hSys)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    keyFileName = 'nesl_libdef';
    % 7 8
    warning('off', 'Simulink:SL_LoadMdlRecursiveLoad');
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    currDir = pwd;
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    libSites = which('-all', keyFileName);
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    libBaseDirs = {};
    for i=1.0:length(libSites)
        libBaseDirs{plus(end, 1.0)} = fileparts(libSites{i});
    end % for
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    libBaseDirs = unique(libBaseDirs);
    nSites = numel(libBaseDirs);
    % 36 38
    % 37 38
    set_param(hSys, 'Lock', 'off');
    % 39 40
    try
        % 41 42
        for idx=1.0:nSites
            libBaseDir = libBaseDirs{idx};
            % 44 45
            cd(libBaseDir);
            libdef = feval(keyFileName);
            if not(isfield(libdef, 'libName'))
                continue;
            end % if
            % 50 51
            if isfield(libdef, 'libDescriptor')
                prodName = libdef.libDescriptor;
            else
                prodName = libdef.libName;
            end % if
            % 56 57
            hLibBlk = add_block('built-in/SubSystem', horzcat(hSys, '/', prodName));
            % 58 60
            % 59 60
            set_param(hLibBlk, 'Mask', 'on');
            set_param(hLibBlk, 'OpenFcn', libdef.libName);
            set_param(hLibBlk, 'Name', prodName);
            set_param(hLibBlk, 'MaskDisplay', horzcat('disp(''', strrep(prodName, sprintf('\n'), '\n'), ''');'));
            set_param(hLibBlk, 'ShowName', 'off');
            set_param(hLibBlk, 'FontSize', '10');
            set_param(hLibBlk, 'Position', '[0 0 100 40]');
            set_param(hLibBlk, 'DropShadow', 'on');
        end % for
        % 69 72
        % 70 72
        % 71 72
        nesl_libautolayout(hSys);
    catch
        % 74 75
        set_param(hSys, 'PostLoadFcn', '');
        disp(lasterr);
    end % try
    cd(currDir);
    % 79 80
    set_param(hSys, 'PostLoadFcn', '');
    warning('on', 'Simulink:SL_LoadMdlRecursiveLoad');
    % 82 83
end % function
