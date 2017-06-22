function setfdasessionhandle(h, hFig)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    ud = get(hFig, 'userdata');
    % 10 11
    ud = setfield(ud, 'sessionHandle', h);
    % 12 13
    set(hFig, 'userdata', ud);
end % function
