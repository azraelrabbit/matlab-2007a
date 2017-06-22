function [tmf, envVal, otherOpts] = get_tmf_for_target(target)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    envVal = '';
    % 14 17
    % 15 17
    prefDirInvalid = false;
    % 17 19
    if isunix
        suffix = '_unix.tmf';
        otherOpts = [];
    else
        % 22 24
        [envVal, suffix, otherOpts] = parse_mexopts_for_envval('');
        % 24 28
        % 25 28
        % 26 28
        if strcmp(computer, 'PCWIN64')
            if not(strcmp(suffix, '_vc.tmf'))
                prefDirInvalid = true;
            end % if
            if not(isempty(getenv('VS80COMNTOOLS')))
                suffix = '_vcx64.tmf';
            else
                suffix = '_vcx64.tmf';
                envVal = 'no default compiler';
            end % if
        end % if
        % 38 40
        if isempty(suffix)
            prefDirInvalid = true;
            switch computer
            case 'PCWIN'
                if not(isempty(getenv('VS71COMNTOOLS'))) || not(isempty(getenv('VS80COMNTOOLS'))) || not(isempty(getenv('DEVSTUDIO'))) || not(isempty(getenv('MSDevDir'))) || not(isempty(getenv('MSVCDir')))
                    % 44 49
                    % 45 49
                    % 46 49
                    % 47 49
                    suffix = '_vc.tmf';
                else
                    if exist(horzcat(matlabroot, '\sys\lcc'))
                        suffix = '_lcc.tmf';
                    else
                        suffix = '_lcc.tmf';
                        envVal = 'no default compiler';
                    end % if
                end % if
            end % switch
        end % if
        % 59 62
        % 60 62
    end % if
    modelName = bdroot;
    if not(isempty(modelName))
        makeRTWObj = get_param(modelName, 'MakeRTWSettingsObject');
        if not(isempty(makeRTWObj))
            if not(prefDirInvalid)
                makeRTWObj.PreferredTMF = suffix;
            else
                makeRTWObj.PreferredTMF = 'unknown';
            end % if
        end % if
    end % if
    tmf = horzcat(target, suffix);
