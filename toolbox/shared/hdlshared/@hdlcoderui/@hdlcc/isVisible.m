function result = isVisible(hSrc)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    result = true;
    if not(hdlcoderui.isslhdlcinstalled)
        result = false;
    end % if
end % function
