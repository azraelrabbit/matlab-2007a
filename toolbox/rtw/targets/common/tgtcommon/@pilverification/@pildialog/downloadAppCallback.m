function downloadAppCallback(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    h.resetPILInterface;
    % 19 21
    % 20 21
    pil_interface = h.getPILInterface;
    % 22 24
    % 23 24
    try
        pil_exe = pil_interface.getApplicationExecutable;
    catch
        [lastMsg, lastId] = lasterr;
        switch lastId
        case pil_get_error_id('errorApplicationOutOfDate')
            % 30 31
            error('The PIL Application is not up to date. Please build the PIL Application before attempting to download.');
        otherwise
            % 33 34
            rethrow(lasterror);
        end % switch
    end % try
    disp(horzcat('Downloading: ', pil_exe));
    % 38 39
    pil_interface.downloadApplication;
    % 40 41
    h.status = 'Download complete.';
end % function
