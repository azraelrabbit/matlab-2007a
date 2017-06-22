function downloadApplication(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(1.0, 2.0, nargin, 'struct'));
    % 11 13
    % 12 13
    exe = h.getApplicationExecutable;
    if isempty(exe)
        error('Please build the PIL Application before attempting to download.');
    end % if
    % 17 20
    % 18 20
    % 19 20
    h.a_downloadApplication(exe);
    % 21 22
    h.appDownloaded = true;
end % function
