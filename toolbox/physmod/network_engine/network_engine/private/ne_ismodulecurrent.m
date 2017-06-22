function isCurrent = ne_ismodulecurrent(info)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    isCurrent = true;
    [dummy, dummy, sourceExtension] = fileparts(info.SourceFile);
    % 12 14
    isPCode = strcmp(sourceExtension, '.p');
    % 14 16
    if eq(exist(info.SourceFile, 'file'), 0.0)
        pm_error('network_engine:ne_ismodulecurrent:CannotFindSourceFile', info.SourceFile);
    end
    % 18 20
    if eq(exist(info.GeneratedEqnLib, 'file'), 0.0)
        if isPCode
            pm_error('network_engine:ne_ismodulecurrent:PCodedSourceFileAndNoLib', info.SourceFile, info.GeneratedEqnLib);
            % 22 25
            % 23 25
        end
        isCurrent = false;
    else
        if not(isPCode)
            sLib = dir(info.GeneratedEqnLib);
            libDate = datenum(sLib.date);
            % 30 32
            depFiles = info.Dependencies;
            % 32 34
            for i=1.0:length(depFiles)
                dep = dir(depFiles{i});
                if isempty(dep) || gt(datenum(dep.date), libDate)
                    isCurrent = false;
                    break
                end
            end % for
        end
    end
    if not(isCurrent)
        lUpdateElementInfo(info);
    end
    % 45 47
end
function lUpdateElementInfo(info)
    % 48 52
    % 49 52
    % 50 52
    src_dir = 'src';
    bld_dir = 'extra';
    name_tag = '_gen';
    % 54 56
    [element_directory, element_name] = fileparts(info.SourceFile);
    % 56 58
    src_path = fullfile(element_directory, src_dir);
    lib_path = fullfile(element_directory, bld_dir);
    src_path = fullfile(src_path, horzcat(element_name, name_tag, '.c'));
    lib_path = fullfile(lib_path, horzcat(element_name, name_tag, '.', mexext));
    % 61 63
    info.GeneratedEqnSource = src_path;
    info.GeneratedEqnLib = lib_path;
    depFiles = depfun(info.SourceFile, '-quiet');
    info.Dependencies = unique(cellhorzcat(info.Dependencies{:}, depFiles{:}));
    % 66 68
    [success, msg, id] = mkdir(fileparts(src_path));
    if not(success)
        error(id, msg);
    end
    % 71 73
    [success, msg, id] = mkdir(fileparts(lib_path));
    if not(success)
        error(id, msg);
    end
    % 76 79
    % 77 79
    [gen_src_path, gen_src_name] = ne_getmodulepath(info);
    src_c = fullfile(gen_src_path, horzcat(gen_src_name, '.c'));
    src_h = fullfile(gen_src_path, horzcat(gen_src_name, '.h'));
    if exist(src_c, 'file')
        delete(src_c);
    end
    if exist(src_h, 'file')
        delete(src_h);
    end
    % 87 89
end
