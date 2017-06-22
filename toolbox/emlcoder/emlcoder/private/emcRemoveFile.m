function [status, result] = emcRemoveFile(filePath, fileName)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    ff = fullfile(filePath, fileName);
    if exist(ff, 'file')
        if ispc
            cmdLine = horzcat('del /f /q "', ff, '"');
            [status, result] = dos(cmdLine);
        else
            cmdLine = horzcat('rm -f ', ff);
            [status, result] = unix(cmdLine);
        end % if
        if not(isempty(result))
            status = 1.0;
        end % if
        fschange(filePath);
    else
        status = 0.0;
        result = [];
    end % if
end % function
