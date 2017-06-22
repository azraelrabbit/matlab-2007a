function state = stviewerstate(type)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 17 21
    % 18 21
    % 19 21
    desktopInstance = com.mathworks.toolbox.systemtest.viewer.NDDesktop.getInstance;
    desktopFrame = desktopInstance.getMainFrame;
    % 22 25
    % 23 25
    state = [];
    if isempty(desktopFrame)
        return;
    end % if
    % 28 31
    % 29 31
    h = stviewer;
    switch type
    case 'testfile'
        state = char(h.jHandle.getViewerTitle);
    case 'viewerstate'
        state = h.getState;
    otherwise
        error('systemtest:stviewerstate:invalidType', 'Invalid state type requested.');
        % 38 40
    end % switch
