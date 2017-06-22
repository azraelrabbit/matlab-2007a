function status = sfrtw_compliant
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if exist(fullfile(matlabroot, 'toolbox', 'stateflow', 'coder', 'private', 'code_machine_source_file_rtw.m'))
        % 10 11
        status = 1.0;
    else
        status = 0.0;
    end % if
end % function
