function ReadOKFlag = verifyFileName(hReader)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ReadOKFlag = false;
    % 9 11
    % 10 11
    FileName = hReader.FileName;
    % 12 14
    % 13 14
    if exist(FileName, 'file')
        % 15 16
        ReadOKFlag = true;
    else
        % 18 19
        error('The file "%s" does not exist.', FileName);
    end % if
    % 21 22
end % function
