function pil_demo_verify_callback(block)
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
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 12 15
    % 13 15
    simulationBlock = slResolve('simulationBlock', block);
    targetBlock = slResolve('targetBlock', block);
    % 16 18
    verify_function = 'target_block_verify';
    nl = sprintf('\n');
    disp(horzcat('** This is an EXAMPLE verification process. **', nl, nl, 'Typically, the user will use the "', targets_hyperlink_manager('new', verify_function, horzcat('help ', verify_function)), '" command ', 'to obtain simulation and target results, and then ', 'apply their own comparison method.', nl, nl, 'In this example, we apply a simple comparison method, which includes ', 'a basic comparison plot.', nl, nl, 'Additionally, results are saved to a .MAT file.', nl, nl));
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    verify_return_args = '[simResults, targetResults] = ';
    spacing = char(mtimes(ones(1.0, plus(1.0, length(horzcat(verify_return_args, verify_function)))), double(' ')));
    verify_args = horzcat('(''', simulationBlock, ''', ... ', sprintf('\n'), spacing, '''', targetBlock, ''')', sprintf('\n'));
    % 31 33
    command = horzcat(verify_function, verify_args);
    disp(horzcat('Running: ', sprintf('\n'), verify_return_args, targets_hyperlink_manager('new', verify_function, horzcat('help ', verify_function)), verify_args));
    % 34 38
    % 35 38
    % 36 38
    [simResults, targetResults] = eval(command);
    algResName = 'simResults';
    targetResName = 'targetResults';
    % 40 42
    saveName = 'verification_results.mat';
    save(saveName, algResName, targetResName);
    disp(horzcat('Saved results to: ', saveName, sprintf('\n')));
    % 44 48
    % 45 48
    % 46 48
    tsWarning = 'tstool:nondoubledata';
    tsWarnState = warning('off', tsWarning);
    % 49 51
    try
        % 51 53
        tstool(simResults, 'replace');
        tstool(targetResults, 'replace');
        % 54 56
        tsToolHandle = tsguis.tsviewer;
        % 56 58
        fnames = fieldnames(simResults);
        for i=1.0:length(fnames)
            fname = fnames{i};
            % 60 62
            if strcmp(class(simResults.(fname)), 'Simulink.Timeseries')
                % 62 64
                rdiff = minus(simResults.(fname), targetResults.(fname));
                tsName = horzcat(fname, ': simulation - target results');
                rdiff.Name = tsName;
                % 66 68
                tsnode = tsToolHandle.SimulinkTSnode.getChildren('Label', tsName);
                if isempty(tsnode)
                    % 69 71
                    tstool(rdiff);
                else
                    % 72 74
                    tsnode.Timeseries.TsValue = rdiff;
                    % 74 76
                    tsnode.timeseries.fireDataChangeEvent;
                end
            end
        end % for
    catch
        % 80 82
        warning(tsWarnState);
        rethrow(lasterror);
    end % try
    % 84 86
    warning(tsWarnState);
    % 86 88
    disp(horzcat('Successfully executed: ', sprintf('\n'), verify_return_args, targets_hyperlink_manager('new', verify_function, horzcat('help ', verify_function)), verify_args));
    % 88 91
    % 89 91
end
