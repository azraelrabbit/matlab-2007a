function displayExplorer(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent me;
    persistent melistener;
    persistent melistener2;
    persistent mdllistener;
    persistent systemRoot;
    persistent speedupReference;
    % 13 16
    % 14 16
    if this.NOBROWSER
        return
    end
    % 18 21
    % 19 21
    if not(isa(me, 'DAStudio.Explorer'))
        me = DAStudio.Explorer(this.TaskAdvisorRoot, 'Model Advisor', false);
        am = DAStudio.ActionManager;
        am.initializeClient(me);
        % 24 27
        % 25 27
        m_file = am.createPopupMenu(me);
        F_exit = am.createAction(me, 'Text', DAStudio.message('Simulink:tools:MAExit'), 'Callback', 'Simulink.TaskAdvisor.closeExplorer;');
        m_file.addMenuItem(F_exit);
        am.addSubMenu(me, m_file, DAStudio.message('Simulink:tools:MAFile'));
        % 30 32
        m_edit = am.createPopupMenu(me);
        E_select = am.createAction(me, 'Text', DAStudio.message('Simulink:tools:MASelect'), 'Callback', 'Simulink.TaskAdvisor.select;');
        E_deselect = am.createAction(me, 'Text', DAStudio.message('Simulink:tools:MADeselect'), 'Callback', 'Simulink.TaskAdvisor.deselect;');
        m_edit.addMenuItem(E_select);
        m_edit.addMenuItem(E_deselect);
        am.addSubMenu(me, m_edit, DAStudio.message('Simulink:tools:MAEdit'));
        this.MEMenus.Select = E_select;
        this.MEMenus.Deselect = E_deselect;
        % 39 41
        m_view = am.createPopupMenu(me);
        V_sourcetab = am.createAction(me, 'Text', DAStudio.message('Simulink:tools:MASourceTab'), 'Callback', 'Simulink.TaskAdvisor.toggleSourcetab;', 'toggleAction', 'on');
        m_view.addMenuItem(V_sourcetab);
        am.addSubMenu(me, m_view, DAStudio.message('Simulink:tools:MAView'));
        this.MEMenus.ViewSourcetab = V_sourcetab;
        % 45 47
        m_help = am.createPopupMenu(me);
        H_mdladvhelp = am.createAction(me, 'Text', DAStudio.message('Simulink:tools:MAModelAdvisorHelp'), 'Callback', 'modeladvisor(''help'');');
        m_help.addMenuItem(H_mdladvhelp);
        am.addSubMenu(me, m_help, DAStudio.message('Simulink:tools:MAHelp'));
        % 50 52
        tb = am.createToolBar(me);
        tb.addAction(E_select);
        tb.addSeparator;
        tb.addAction(E_deselect);
        % 55 57
        hb = awtcreate('com.mathworks.mwswing.MJFrame');
        sfTk = hb.getToolkit;
        screenSize = sfTk.getScreenSize;
        height = screenSize.getHeight;
        width = screenSize.getWidth;
        x = floor(mrdivide(width, 6.0));
        y = floor(mrdivide(height, 6.0));
        height = floor(mrdivide(height, 1.5));
        width = floor(mrdivide(width, 1.5));
        me.position = horzcat(x, y, width, height);
        % 66 68
        me.icon = fullfile(matlabroot, 'toolbox', 'matlab', 'icons', 'simulinkicon.gif');
        % 68 70
        melistener = handle.listener(me, 'MEPostClosed', cellhorzcat(@MECallback));
        % 70 72
        melistener2 = handle.listener(me, 'METreeSelectionChanged', cellhorzcat(@MECallback));
        % 72 85
        % 73 85
        % 74 85
        % 75 85
        % 76 85
        % 77 85
        % 78 85
        % 79 85
        % 80 85
        % 81 85
        % 82 85
        % 83 85
    end
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    if isempty(systemRoot) || ne(systemRoot, get_param(bdroot(this.System), 'handle'))
        if isa(mdllistener, 'handle.listener')
            mdllistener.delete;
        end
        systemRoot = get_param(bdroot(this.System), 'handle');
        % 95 97
        mdlObj = get_param(bdroot(this.System), 'Object');
        mdllistener = handle.listener(mdlObj, 'CloseEvent', @LocalCloseCB);
    end
    % 99 101
    me.Title = horzcat('Model Advisor  - ', getfullname(this.System));
    me.setTreeTitle(horzcat(DAStudio.message('Simulink:tools:MATaskHierarchy'), ': ', getfullname(this.System)));
    % 102 104
    this.MAExplorer = me;
    me.setRoot(this.TaskAdvisorRoot);
    speedupReference = this.TaskAdvisorRoot;
    % 106 108
    me.showListView(false);
    me.show;
end
function MECallback(this, event)
    % 111 113
    switch event.type
    case 'MEPostClosed'
        % 114 116
        Simulink.ModelAdvisor.getActiveModelAdvisorObj([]);
        this.delete;
    case 'METreeSelectionChanged'
        modeladvisorprivate('modeladvisorutil2', 'UpdateMEMenuToolbar', this);
    otherwise
        error('unknown event received');
    end
end
function LocalCloseCB(eventSrc, eventData)
    % 124 126
    mdladvObj = eventSrc.getModelAdvisorObj;
    mdladvObj.closeExplorer;
    if isa(mdladvObj.MAExplorer, 'DAStudio.Explorer')
        event.type = 'MEPostClosed';
        MECallback(mdladvObj.MAExplorer, event);
    end
    if isa(mdladvObj.ListExplorer, 'DAStudio.Explorer')
        mdladvObj.ListExplorer.delete;
    end
    loc_saveTANInfo(mdladvObj.AtticData.MatFileName, mdladvObj.TaskAdvisorCellArray);
end
function loc_saveTANInfo(mdladvInfoMatFileName, TaskAdvisorCellArray)
    % 137 139
    temp = {};
    for i=1.0:length(TaskAdvisorCellArray)
        temp{i}.State = TaskAdvisorCellArray{i}.State;
        temp{i}.WaiveFailure = TaskAdvisorCellArray{i}.WaiveFailure;
        temp{i}.InternalState = TaskAdvisorCellArray{i}.InternalState;
        temp{i}.Selected = TaskAdvisorCellArray{i}.Selected;
    end % for
    TaskAdvisorCellArray = temp;
    if exist(mdladvInfoMatFileName, 'file')
        save(mdladvInfoMatFileName, 'TaskAdvisorCellArray', '-append');
    end
end
