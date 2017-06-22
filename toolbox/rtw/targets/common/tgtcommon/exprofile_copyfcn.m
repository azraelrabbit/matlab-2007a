function exprofile_copyfcn(block)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    model = bdroot(block);
    execCopyFcn = get_param(gcb, 'execCopyFcn');
    if strcmp(execCopyFcn, 'on')
        set_param(block, 'execCopyFcn', 'off')
        blockName = strrep(block, char(10.0), ' ');
        cs = getActiveConfigSet(model);
        params = get_param(cs, 'ObjectParameters');
        if not(isfield(params, 'ExecutionProfilingEnabled'))
            msgbox(horzcat('Operation of the execution profiling block ''', blockName, ''' requires that ', '(a) the appropriate System Target File is selected, and (b) the option ', 'to enable execution profiling is checked. You must perform these steps ', 'manually.'), 'Copy Execution Profiling Block');
        else
            % 20 26
            % 21 26
            % 22 26
            % 23 26
            % 24 26
            % 25 27
            enabled = get_param(cs, 'ExecutionProfilingEnabled');
            if strcmp(enabled, 'off')
                maskType = get_param(block, 'masktype');
                answer = questdlg(horzcat('Operation of the execution profiling block ''', blockName, ''' ', 'requires that ', 'execution ', 'profiling is enabled for the model ''', model, '''. Do you wish to enable ', 'execution profiling now?'), 'Copy Execution Profiling Block', 'Yes', 'No', 'Yes');
                % 30 38
                % 31 38
                % 32 38
                % 33 38
                % 34 38
                % 35 38
                % 36 38
                if strcmp(answer, 'Yes')
                    set_param(cs, 'ExecutionProfilingEnabled', 'on');
                    setPropEnabled(cs, 'ExecutionProfilingNumSamples', 1.0);
                end % if
            end % if
        end % if
    end % if
end % function
