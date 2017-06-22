function WriteOKFlag = verifyFileName(hWriter)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    WriteOKFlag = false;
    % 9 11
    % 10 11
    FileName = hWriter.FileName;
    % 12 14
    % 13 14
    if exist(FileName, 'file')
        % 15 20
        % 16 20
        % 17 20
        % 18 20
        % 19 20
        Question = sprintf('The file "%s" already exists.\n\nDo you want to overwrite it?', FileName);
        % 21 22
        Title = sprintf('Overwrite File?');
        YesText = sprintf('Yes');
        NoText = sprintf('No');
        % 25 27
        % 26 27
        ButtonName = questdlg(Question, Title, YesText, NoText, YesText);
        % 28 30
        % 29 30
        if strcmp(ButtonName, YesText)
            % 31 32
            try
                % 33 34
                delete(FileName);
                % 35 38
                % 36 38
                % 37 38
            end % try
            % 39 41
            % 40 41
            if exist(FileName, 'file')
                % 42 43
                error('The file "%s" could not be overwritten.', FileName);
            else
                % 45 47
                % 46 47
                WriteOKFlag = true;
            end % if
        end % if
    else
        % 51 53
        % 52 53
        WriteOKFlag = true;
    end % if
    % 55 56
end % function
