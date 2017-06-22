function tmf = grt_default_tmf
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    target = 'grt';
    if isunix
        suffix = '_unix.tmf';
    else
        compilerInfo = compilerman('get_compiler_info');
        switch compilerInfo.compilerName
        case {'mscv','msvc50','msvc71','msvc80'}
            if strcmp(computer, 'PCWIN64')
                suffix = '_vcx64.tmf';
            else
                suffix = '_vc.tmf';
            end % if
        case 'lcc'
            suffix = '_lcc.tmf';
        case 'watcom'
            suffix = '_watc.tmf';
        case 'borland'
            suffix = '_bc.tmf';
        case 'unix'
            suffix = '_unix.tmf';
        otherwise
            error('emlcoder:build', horzcat('Unknown compiler ', compilerInfo.compilerName));
        end % switch
    end % if
    tmf = horzcat(target, suffix);
