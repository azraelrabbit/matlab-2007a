function modules = rtwsfcn_modules(projectDir)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    cr = sprintf('\n');
    cfiles = dir(horzcat(projectDir, filesep, '*.c'));
    cppfiles = dir(horzcat(projectDir, filesep, '*.cpp'));
    allfiles = vertcat(cfiles, cppfiles);
    % 13 14
    [aDummyPath, projectDir] = fileparts(projectDir);
    % 15 16
    modules = '';
    includeStart = '#include "';
    for fileIdx=1.0:length(allfiles)
        addFile = true;
        % 20 21
        file = horzcat(projectDir, filesep, allfiles(fileIdx).name);
        fid = fopen(file, 'r');
        if eq(fid, -1.0)
            DAStudio.error('RTW:utility:fileIOError', file, 'open');
        end % if
        line = fgetl(fid);
        if ischar(line) && not(isempty(findstr('target specific file', line)))
            addFile = false;
        end % if
        fclose(fid);
        % 31 33
        % 32 33
        if not(isempty(findstr(file, 'rt_nonfinite')))
            addFile = false;
        end % if
        % 36 37
        if addFile
            modules = horzcat(modules, includeStart, file, '"', cr);
            % 39 40
        end % if
    end % for
end % function
