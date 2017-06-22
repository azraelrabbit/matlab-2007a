function [e, l] = DialogCreate(emcProj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    persistent iconPath;
    % 6 8
    if isempty(iconPath)
        iconPath = fullfile(matlabroot, 'toolbox', 'shared', 'dastudio', 'resources');
    end
    % 10 12
    e = DAStudio.Explorer(emcProj, 'EMC Project Manager', false);
    preferPos = get_position;
    e.position = preferPos;
    e.Title = horzcat('EMC Project Manager (', emcProj.Name, ')');
    e.Icon = fullfile(iconPath, 'ModelExplorer.png');
    e.setTreeTitle('Project Hierarchy');
    e.allowWholeRowDblClick = true;
    % 18 22
    % 19 22
    % 20 22
    l = handle.listener(e, 'MEPostClosed', cellhorzcat(@post_closed_callback, emcProj));
    l(plus(end, 1.0)) = handle.listener(e, 'MEListSelectionChanged', cellhorzcat(@listSelectionChanged));
    % 23 25
    l(plus(end, 1.0)) = handle.listener(e, 'METreeSelectionChanged', cellhorzcat(@treeSelectionChanged));
    % 25 28
    % 26 28
    ime = DAStudio.imExplorer(e);
    % 28 30
    ime.showDialogView;
    ime.setListViewWidth(mtimes(preferPos(3.0), .25));
    % 31 34
    % 32 34
    am = DAStudio.ActionManager;
    am.initializeClient(e);
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    i.addEntryPoint = am.createAction(e, 'Text', 'Add Entry Point', 'Tag', 'AddEntryPoint', 'ToolTip', 'Add a function entry point', 'Callback', 'emlcprivate(''callproc'',''DialogAction'',%d);', 'Icon', fullfile(iconPath, 'Function.png'), 'StatusTip', 'Add a function entry point');
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    i.addInput = am.createAction(e, 'Text', 'Add Input', 'Tag', 'AddIDP', 'ToolTip', 'Add a function input', 'Callback', 'emlcprivate(''callproc'',''DialogAction'',%d);', 'Icon', fullfile(iconPath, 'StateflowData.png'), 'StatusTip', 'Add a function input');
    % 47 54
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    i.addFiInput = am.createAction(e, 'Text', 'Add Fi Input', 'Tag', 'AddFiIDP', 'ToolTip', 'Add a fi function input', 'Callback', 'emlcprivate(''callproc'',''DialogAction'',%d);', 'Icon', fullfile(iconPath, 'SimulinkParameter.png'), 'StatusTip', 'Add a fi function input');
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    i.addStructInput = am.createAction(e, 'Text', 'Add Struct Input', 'Tag', 'AddStructIDP', 'ToolTip', 'Add a struct function input', 'Callback', 'emlcprivate(''callproc'',''DialogAction'',%d);', 'Icon', fullfile(iconPath, 'SimulinkBus.png'), 'StatusTip', 'Add a struct function input');
    % 61 69
    % 62 69
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    i.Cut = am.createDefaultAction(e, 'EDIT_CUT');
    i.Copy = am.createDefaultAction(e, 'EDIT_COPY');
    i.Paste = am.createDefaultAction(e, 'EDIT_PASTE');
    % 71 73
    i.Delete = am.createAction(e, 'text', xlate('&Delete'), 'Tag', 'Delete', 'Callback', 'emlcprivate(''callproc'',''DialogAction'',%d);', 'accel', 'Del', 'Icon', fullfile(iconPath, 'delete.png'), 'statusTip', xlate('Delete the selected objects'), 'toolTip', xlate('Delete'));
    % 73 84
    % 74 84
    % 75 84
    % 76 84
    % 77 84
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    toolBar = am.createToolBar(e);
    % 84 86
    toolBar.addAction(i.addEntryPoint);
    toolBar.addAction(i.addInput);
    toolBar.addAction(i.addFiInput);
    toolBar.addAction(i.addStructInput);
    toolBar.addSeparator;
    % 90 92
    toolBar.addAction(i.Cut);
    toolBar.addAction(i.Copy);
    toolBar.addAction(i.Paste);
    toolBar.addAction(i.Delete);
    toolBar.addSeparator;
    % 96 98
    e.UserData = i;
    DialogEnableActions(e);
    e.show;
end
function treeSelectionChanged(eSrc, eData)
    % 102 105
    % 103 105
    DialogEnableActions(eSrc);
end
function listSelectionChanged(eSrc, eData)
    % 107 110
    % 108 110
    DialogEnableActions(eSrc);
end
function post_closed_callback(eSrc, eData, emcProj)
    % 112 114
    DialogManager('close', emcProj);
end
function position = get_position
    % 116 120
    % 117 120
    % 118 120
    w = 1024.0;
    h = 544.0;
    screenSize = get(0.0, 'ScreenSize');
    pX = max(1.0, mrdivide(minus(screenSize(3.0), w), 2.0));
    pY = max(1.0, mrdivide(minus(screenSize(4.0), h), 2.0));
    position = horzcat(pX, pY, w, h);
    return
end
