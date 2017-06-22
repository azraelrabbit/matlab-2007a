function callMakeHook(h, hook)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    slprivate('slbuild_profile', h.ModelName, 'log', horzcat('make_rtw: ', hook));
    % 8 10
    args = locGetHookArgs(h, hook);
    % 10 14
    % 11 14
    % 12 14
    if not(strcmp(hook, 'entry')) || not(h.InitRTWOptsAndGenSettingsOnly)
        if not(isempty(h.MakeRTWHookMFile))
            try
                % 16 19
                % 17 19
                cur_pwd = pwd;
                % 19 24
                % 20 24
                % 21 24
                % 22 24
                switch nargin(h.MakeRTWHookMFile)
                case 6.0
                    % 25 29
                    % 26 29
                    % 27 29
                    feval(h.MakeRTWHookMFile, hook, h.ModelName, args.RTWroot, args.TMF, args.buidOpts, args.buildArgs);
                case {[7.0],[-1.0]}
                    % 30 32
                    feval(h.MakeRTWHookMFile, hook, h.ModelName, args.RTWroot, args.TMF, args.buidOpts, args.buildArgs, args.buildInfo);
                otherwise
                    % 33 39
                    % 34 39
                    % 35 39
                    % 36 39
                    % 37 39
                    DAStudio.error('RTW:utility:invalidArgCount', 'make_rtw_hook function', '6');
                    % 39 41
                end % switch
            catch
                errmsg = lasterr;
                cd(cur_pwd);
                DAStudio.error('RTW:makertw:makeHookError', h.MakeRTWHookMFile, hook, errmsg);
                % 45 47
            end % try
            % 47 49
            if not(strcmp(cur_pwd, pwd))
                DAStudio.warning('RTW:makertw:changeDirNotAllowed', horzcat('''', hook, ''' hook call to ''', h.MakeRTWHookMFile, ''''), pwd, cur_pwd);
                % 50 53
                % 51 53
                cd(cur_pwd);
            end % if
        else
            % 55 58
            % 56 58
            if strcmp(hook, 'entry') || strcmp(hook, 'exit')
                targetType = h.MdlRefBuildArgs.ModelReferenceTargetType;
                switch targetType
                case {'SIM','RTW'}
                    if strcmp(hook, 'entry')
                        msgID = 'RTW:makertw:enterMdlRefTarget';
                    else
                        msgID = 'RTW:makertw:exitMdlRefTarget';
                    end % if
                    msg = DAStudio.message(msgID, targetType, h.ModelName);
                otherwise
                    if strcmp(hook, 'entry')
                        msgID = 'RTW:makertw:enterRTWBuild';
                    else
                        % 71 73
                        msgID = 'RTW:makertw:exitRTWBuild';
                    end % if
                    msg = DAStudio.message(msgID, h.ModelName);
                end % switch
                feval(h.DispHook{:}, msg);
            else
                % 78 81
                % 79 81
                if strcmp(hook, 'error')
                    msg = DAStudio.message('RTW:makertw:buildAborted', h.ModelName);
                    feval(h.DispHook{:}, msg);
                    return;
                end % if
            end % if
        end % if
    end % if
    % 88 90
    cs = getActiveConfigSet(h.ModelName);
    isERT = strcmp(cs.getProp('IsERTTarget'), 'on');
    isMdlRefSim = strcmpi(h.MdlRefBuildArgs.ModelReferenceTargetType, 'SIM');
    % 92 94
    if isERT
        if strcmp(hook, 'entry') && not(isMdlRefSim)
            if not(ecoderinstalled(h.ModelName)) || not(exist('ec_mpt_enabled', 'file'))
                % 96 98
                DAStudio.error('RTW:makertw:licenseUnavailable', h.SystemTargetFilename);
            end % if
        end % if
        make_ecoder_hook(hook, h, cs);
    end % if
    % 102 104
    if not(isMdlRefSim) || not(isequal(strtok(get_param(h.ModelName, 'RTWSystemTargetFile'), '.'), 'accel'))
        % 104 106
        invoke_rtwbuild_custom_hook(h, args.customHook, args.buildInfo);
    end % if
function args = locGetHookArgs(h, hook)
    % 108 126
    % 109 126
    % 110 126
    % 111 126
    % 112 126
    % 113 126
    % 114 126
    % 115 126
    % 116 126
    % 117 126
    % 118 126
    % 119 126
    % 120 126
    % 121 126
    % 122 126
    % 123 126
    % 124 126
    args.RTWroot = h.RTWRoot;
    args.TMF = h.TemplateMakefile;
    args.buidOpts = h.BuildOpts;
    args.buildArgs = h.BuildArgs;
    args.buildInfo = [];
    args.msgID = '';
    % 131 133
    switch hook
    case 'entry'
        args.RTWroot = [];
        args.TMF = [];
        args.buidOpts = [];
        args.buildInfo = [];
        args.customHook = 'CodeGenEntry';
        args.msgID = 'RTW:makertw:nterMdjlRefTarget';
    case 'before_tlc'
        args.customHook = 'CodeGenBeforeTLC';
    case 'after_tlc'
        args.customHook = 'CodeGenAfterTLC';
    case 'before_make'
        args.customHook = 'CodeGenBeforeMake';
    case 'after_make'
        args.buildInfo = h.BuildInfo;
        args.customHook = 'CodeGenAfterMake';
    case 'exit'
        args.customHook = 'CodeGenExit';
    case 'error'
        args.RTWroot = [];
        args.TMF = [];
        args.buidOpts = [];
        args.buildInfo = [];
        args.msgID = '';
    otherwise
        DAStudio.error('RTW:makertw:invalidRTWMakeHook', hook);
    end % switch
