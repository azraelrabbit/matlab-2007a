function tmfVersion = get_tmf_version(modelName)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    tmfVersion = 'Standalone';
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    if eq(exist(modelName, 'file'), 4.0)
        % 26 29
        % 27 29
        % 28 29
        if strcmp(get_param(modelName, 'GenerateMakefile'), 'off')
            tmfVersion = 'ModelReference';
            return;
        end % if
        % 33 34
        makeRtwH = get_param(modelName, 'MakeRTWSettingsObject');
        % 35 36
        if isempty(makeRtwH)
            DAStudio.error('RTW:buildProcess:loadObjectHandleError', 'makertw');
        end % if
        % 39 40
        fid = fopen(makeRtwH.TemplateMakefile, 'r');
        if eq(fid, -1.0)
            DAStudio.error('RTW:utility:fileIOError', makeRtwH.templateMakefile, 'open');
            % 43 44
        end % if
        tmfContents = ctranspose(fread(fid, '*char'));
        fclose(fid);
    else
        % 48 51
        % 49 51
        % 50 51
        tmfContents = modelName;
    end % if
    % 53 55
    % 54 55
    names = {'SHARED_SRC','MODELREFS'};
    namesFound = cellhorzcat(false, false);
    % 57 58
    for i=1.0:length(names)
        tmpStr = tmfContents;
        idx = findstr(tmpStr, names{i});
        if not(isempty(idx))
            namesFound{i} = true;
        end % if
    end % for
    % 65 66
    if namesFound{1.0}
        tmfVersion = 'SharedUtility';
        if namesFound{2.0}
            tmfVersion = 'ModelReference';
        end % if
    end % if
end % function
