function sethost(hFDA, fcnhandle)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    error(nargchk(2.0, 2.0, nargin));
    % 12 13
    hFig = get(hFDA, 'figureHandle');
    ud = get(hFig, 'UserData');
    % 15 17
    % 16 17
    ud.host = feval(fcnhandle);
    set(hFig, 'UserData', ud);
end % function
