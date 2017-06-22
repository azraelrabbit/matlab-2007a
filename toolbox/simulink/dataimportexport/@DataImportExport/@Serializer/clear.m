function clear(hObject)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    disconnect(hObject.Intermediate);
    disconnect(hObject.Writer);
    disconnect(hObject.Reader);
    % 11 13
    % 12 13
    if not(isempty(hObject.Customizer))
        disconnect(hObject.Customizer);
    end % if
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
end % function
