function savehds(h, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    import com.mathworks.toolbox.systemtest.viewer.*;
    % 7 10
    % 8 10
    pathname = '';
    if eq(nargin, 1.0)
        [filename, pathname] = uiputfile({'*.mat';'*.*'}, 'Save as');
        if isnumeric(filename)
            return;
        end % if
        fullfilename = fullfile(pathname, filename);
    else
        fullfilename = strrep(varargin{1.0}, '[Read Only]', '');
    end % if
    [junk, info] = fileattrib(fullfilename);
    if junk && not(info.UserWrite)
        msg = sprintf('''%s'' is Read-Only.  Do you want to overwrite it?', fullfilename);
        ButtonName = questdlg(msg, 'Test Results Viewer', 'Overwrite', 'Cancel', 'Cancel');
        % 23 26
        % 24 26
        if strcmp(ButtonName, 'Cancel')
            return;
        else
            fileattrib(fullfilename, '+w');
        end % if
    end % if
    stresults = h.FilterCtrl.Dataset;
    % 32 35
    % 33 35
    try
        save(fullfilename, 'stresults');
        h.jHandle.setViewerTitle(fullfilename);
        viewerstate = h.getState;
        save(fullfilename, 'viewerstate', '-append');
    catch
        uiwait(errordlg(sprintf('Could not save the data. Error returned was:\n%s', lasterr), 'Test Results Viewer', 'modal'))
        % 41 43
        return;
    end % try
    % 44 47
    % 45 47
    if le(nargin, 2.0)
        h.jHandle.setDirty(false);
    end % if
