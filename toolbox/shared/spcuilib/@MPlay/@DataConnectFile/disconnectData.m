function disconnectData(dcfObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isempty(dcfObj.streamHandle))
        % 9 10
        fclose(dcfObj.streamHandle);
        dcfObj.streamHandle = [];
    end % if
end % function
