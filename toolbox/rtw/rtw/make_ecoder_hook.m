function make_ecoder_hook(hook, h, cs)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if strcmp(h.MdlRefBuildArgs.ModelReferenceTargetType, 'SIM')
        return;
    end % if
    % 12 14
    mptEnabled = ec_mpt_enabled(h.ModelName);
    % 14 16
    switch hook
    case 'entry'
        if mptEnabled
            mpt_ecoder_hook(hook, h.ModelName);
        end % if
    case 'before_tlc'
        % 21 24
        % 22 24
        try
            LocalExpandCodeTemplates(h, cs);
            LocalCopyCustomTemplates(h, cs);
        catch
            rethrow(lasterror);
        end % try
        % 29 31
        if mptEnabled
            mpt_ecoder_hook(hook, h.ModelName);
        end % if
    case 'after_tlc'
        % 34 37
        % 35 37
        if mptEnabled
            mpt_ecoder_hook(hook, h.ModelName);
        end % if
    case 'before_make'
        % 40 43
        % 41 43
        if mptEnabled
            mpt_ecoder_hook(hook, h.ModelName);
        end % if
    case 'after_make'
        % 46 49
        % 47 49
        if mptEnabled
            mpt_ecoder_hook(hook, h.ModelName);
        end % if
    case 'exit'
        % 52 55
        % 53 55
        if mptEnabled
            mpt_ecoder_hook(hook, h.ModelName);
        end % if
    otherwise
        % 58 61
        % 59 61
        if mptEnabled
            mpt_ecoder_hook(hook, h.ModelName);
        end % if
        % 63 65
    end % switch
function LocalExpandCodeTemplates(h, cs)
    % 66 70
    % 67 70
    % 68 70
    usList = cellhorzcat(get_param(cs, 'ERTDataHdrFileTemplate'), get_param(cs, 'ERTDataSrcFileTemplate'), get_param(cs, 'ERTHdrFileBannerTemplate'), get_param(cs, 'ERTSrcFileBannerTemplate'));
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    list = unique(usList);
    % 76 78
    for i=1.0:length(list)
        cgtName = list{i};
        % 79 83
        % 80 83
        % 81 83
        [fpath, fname, fext] = fileparts(cgtName);
        if not(isempty(fpath))
            tlcName = horzcat(fname, fext);
        else
            tlcName = cgtName;
        end % if
        tlcName = rtw_cgt_name_conv(tlcName, 'cgt2tlc');
        % 89 92
        % 90 92
        outfile = fullfile(h.BuildDirectory, h.GeneratedTLCSubDir, tlcName);
        if exist(outfile, 'file')
            rtw_delete_file(outfile);
        end % if
        % 95 97
        fullPathName = which(cgtName);
        % 97 99
        if isempty(fullPathName)
            if exist(cgtName, 'file')
                fullPathName = cgtName;
            end % if
        end % if
        % 103 105
        if not(isempty(fullPathName))
            if isequal(fext, '.cgt')
                rtw_expand_template(fullPathName, outfile);
            else
                rtw_copy_file(fullPathName, outfile);
            end % if
        end % if
    end % for
function LocalCopyCustomTemplates(h, cs)
    % 113 117
    % 114 117
    % 115 117
    try
        templateFile = strtok(get_param(cs, 'ERTCustomFileTemplate'));
        % 118 122
        % 119 122
        % 120 122
        [dirstr, fname, ext] = fileparts(templateFile);
        outfile = fullfile(h.BuildDirectory, h.GeneratedTLCSubDir, horzcat(fname, ext));
        if exist(outfile, 'file')
            rtw_delete_file(outfile);
        end % if
        % 126 128
        templateFile = which(templateFile);
        % 128 131
        % 129 131
        if not(isempty(templateFile))
            rtw_copy_file(templateFile, outfile);
        end % if
    catch
        rethrow(lasterror);
    end % try
