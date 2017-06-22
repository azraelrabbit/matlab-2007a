function urnFile = file2urn(fileName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    fileName = strrep(fileName, ' ', '%20');
    % 9 11
    % 10 11
    if strncmp(fileName, '/', 1.0)
        urnFile = horzcat('file://', fileName);
    else
        urnFile = horzcat('file:///', strrep(fileName, '\', '/'));
    end % if
end % function
