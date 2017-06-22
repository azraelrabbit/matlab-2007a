function makeCmd = wrap_make_cmd(args)
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
    makeCmd = LocTargetSpecificWrapMakeCmd(args);
    % 12 14
    if isempty(makeCmd)
        if ispc
            makeCmd = LocPCWrapMakeCmd(args);
        else
            makeCmd = args.makeCmd;
        end % if
    end % if
end % function
function oMakeCmd = LocTargetSpecificWrapMakeCmd(args)
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    oMakeCmd = '';
    % 27 29
    hook = rtw_hook_name(args.sysTargetFile, 'wrap_make_cmd');
    % 29 31
    if not(isempty(hook))
        % 31 33
        oMakeCmd = feval(hook, args);
        % 33 35
    end % if
end % function
function makeCmd = LocPCWrapMakeCmd(args)
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    if strcmp(args.compilerEnvVal, 'no default compiler')
        aGetEnvVarsSuggestions.EnvVarSuggestions = 1.0;
        switch computer
        case 'PCWIN'
            envVarMsg = setup_for_visual(aGetEnvVarsSuggestions);
        case 'PCWIN64'
            envVarMsg = setup_for_visual_x64(aGetEnvVarsSuggestions);
        end % switch
        DAStudio.error('RTW:compilerConfig:compilerUnavailable', envVarMsg);
    end % if
    % 55 59
    % 56 59
    % 57 59
    if ge(length(args.make), 5.0) && strcmp(args.make(1.0:5.0), 'nmake')
        % 59 61
        switch computer
        case 'PCWIN'
            makeCmd = setup_for_visual(args);
        case 'PCWIN64'
            makeCmd = setup_for_visual_x64(args);
        end % switch
    else
        if ge(length(args.make), 9.0) && strcmp(args.make(2.0:9.0), '%WATCOM%')
            % 68 70
            makeCmd = setup_for_watcom(args);
        else
            if ge(length(args.make), 10.0) && strcmp(args.make(2.0:10.0), '%BORLAND%')
                % 72 74
                makeCmd = setup_for_borland(args);
            else
                if ge(length(args.make), 10.0) && strcmp(args.make(minus(end, 5.0):minus(end, 1.0)), 'gmake')
                    % 76 78
                    if strcmp(args.TemplateMakefile(minus(end, 8.0):end), 'intel.tmf')
                        makeCmd = setup_for_intel(args);
                    else
                        makeCmd = setup_for_lcc(args);
                    end % if
                else
                    % 83 86
                    % 84 86
                    endl = sprintf('\n');
                    % 86 88
                    disp(horzcat('### Wrapping unrecognized make command (angle brackets added)', endl, '###    <', args.make, '>', endl, '### in default batch file'));
                    % 88 92
                    % 89 92
                    % 90 92
                    makeCmd = setup_for_lcc(args);
                    % 92 94
                end % if
            end % if
        end % if
    end % if
end % function
