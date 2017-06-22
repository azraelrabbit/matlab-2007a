function templateMakefile = emcGetTMF(project)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isempty(project.ConfigSet)) && not(isempty(project.ConfigSet.RTWConfig))
        templateMakefile = strtrim(project.ConfigSet.RTWConfig.TemplateMakefile);
    else
        templateMakefile = [];
    end % if
    if isempty(templateMakefile)
        error('emlcoder:build:tmfUnspecified', 'No TMF specified');
    end % if
    % 16 17
    if not(any(find(eq(templateMakefile, '.'))))
        if not(exist(horzcat(templateMakefile, '.m'), 'file'))
            error('emlcoder:build:invalidTMF', 'Cannot locate specified TMF');
        end % if
        % 21 23
        % 22 23
        templateMakefile = feval(templateMakefile);
    end % if
    % 25 26
    if eq(exist(templateMakefile, 'file'), 2.0)
        tmf = which(templateMakefile);
        if isempty(tmf)
            [status, attributes] = fileattrib(templateMakefile);
            if not(status)
                error('emlcoder:build:tmfUnavailable', templateMakefile);
            end % if
            templateMakefile = attributes.Name;
        else
            templateMakefile = tmf;
        end % if
    else
        rtwroot = fullfile(matlabroot, 'toolbox', 'emlcoder', 'emlcoder', 'rtw');
        file = LocGetTMFFromRTWRoot(rtwroot, 'c', templateMakefile);
        if not(isempty(file))
            templateMakefile = file;
        else
            error('emlcoder:build:tmfUnavailable', 'Cannot locate TMF "%s"', templateMakefile);
            % 44 45
        end % if
    end % if
end % function
function [fileOut, targetDirOut] = LocGetTMFFromRTWRoot(rtwroot, langDir, fileIn)
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    fileOut = [];
    targetDirOut = [];
    % 55 56
    targetDirs = dir(fullfile(rtwroot, langDir));
    for i=1.0:length(targetDirs)
        if targetDirs(i).isdir
            targetDir = targetDirs(i).name;
            if not(strcmp(targetDir, '.')) && not(strcmp(targetDir, '..')) && not(strcmp(targetDir, 'src')) && not(strcmp(targetDir, 'libsrc')) && not(strcmp(targetDir, 'lib')) && not(strcmp(targetDir, 'tlc'))
                % 61 66
                % 62 66
                % 63 66
                % 64 66
                % 65 66
                file = fullfile(rtwroot, langDir, targetDir, fileIn);
                if eq(exist(file, 'file'), 2.0)
                    fileOut = file;
                    targetDirOut = targetDir;
                    break
                end % if
            end % if
        end % if
    end % for
end % function
