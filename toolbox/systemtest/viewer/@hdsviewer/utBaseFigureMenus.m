function utBaseFigureMenus(f)
    % 1 7
    % 2 7
    % 3 7
    import com.mathworks.toolbox.systemtest.viewer.*;
    % 5 7
    jViewer = com.mathworks.toolbox.systemtest.viewer.NDDesktop.getInstance;
    % 7 10
    % 8 10
    filemenu = findall(f, 'type', 'uimenu', 'label', '&File');
    editmenu = findall(f, 'type', 'uimenu', 'label', '&Edit');
    viewmenu = findall(f, 'type', 'uimenu', 'label', '&View');
    deskmenu = findall(f, 'type', 'uimenu', 'label', '&Desktop');
    windmenu = findall(f, 'type', 'uimenu', 'label', '&Window');
    helpmenu = findall(f, 'type', 'uimenu', 'label', '&Help');
    demomenu = findall(f, 'type', 'uimenu', 'label', '&Demos');
    if not(isempty(demomenu))
        set(demomenu, 'Callback', 'helpmenufcn(gcbf,''HelpDemos'')');
    end % if
    % 19 22
    % 20 22
    showmenubyname(f, '&New');
    showmenubyname(f, '&Open...');
    showmenubyname(f, 'Generate &M-File...');
    showmenubyname(f, '&Import Data...');
    showmenubyname(f, 'Save &Workspace As...');
    % 26 28
    set(showmenubyname(f, 'Basic &Fitting'), 'Enable', 'on')
    set(showmenubyname(f, '&Data Statistics'), 'Enable', 'on')
    % 29 33
    % 30 33
    % 31 33
    showmenubyname(f, '&Find Files...');
    showmenubyname(f, 'Clear &Figure');
    showmenubyname(f, 'Clear &Command Window');
    showmenubyname(f, 'Clear &Command History');
    showmenubyname(f, 'Clear &Workspace');
    % 37 40
    % 38 40
    showmenubyname(f, 'Figure Palette');
    showmenubyname(f, 'Plot Browser');
    % 41 44
    % 42 44
    delete(findall(f, 'Type', 'uimenu', 'Label', char(jViewer.fLoadAction.getName)));
    delete(findall(f, 'Type', 'uimenu', 'Label', char(jViewer.fsaveAction.getName)));
    delete(findall(f, 'Type', 'uimenu', 'Label', char(jViewer.fsaveAsAction.getName)));
    delete(findall(f, 'Type', 'uimenu', 'Label', 'Exit Test Results Viewer'));
    delete(findall(f, 'Type', 'uimenu', 'Label', '&Constraints'));
    delete(findall(f, 'Type', 'uimenu', 'Label', '&Results'));
    delete(findall(f, 'Type', 'uimenu', 'Label', '&Plots'));
    delete(findall(f, 'Type', 'uimenu', 'Label', 'Test Results Viewer Help'));
    delete(findall(f, 'Type', 'uimenu', 'Label', 'SystemTest User''s Guide'));
    delete(findall(f, 'Type', 'uimenu', 'Label', 'SystemTest Demos'));
    delete(findall(f, 'Type', 'uimenu', 'Label', 'About SystemTest'));
    set(findobj(allchild(helpmenu), 'Label', '&Graphics Help'), 'Separator', 'off')
    % 55 57
    set(changemenulabel(f, '&Close Figure', '&Close'), 'Separator', 'off');
    m = changemenulabel(f, '&Save Figure', '&Save');
    set(m, 'Accelerator', 'S');
    changemenulabel(f, 'Save Figure &As...', 'Save &As...');
function m = showmenubyname(f, name)
    % 61 64
    % 62 64
    m = findall(f, 'type', 'uimenu', 'label', name);
    if not(isempty(m))
        set(m, 'Visible', 'on');
    end % if
function m = changemenulabel(f, orig, new)
    % 68 70
    m = findall(f, 'type', 'uimenu', 'label', orig);
    if not(isempty(m))
        set(m, 'label', new);
    end % if
