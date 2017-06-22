function displayListView(this, ListViewParameterStruct, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent me;
    persistent melistener;
    % 9 12
    % 10 12
    if this.NOBROWSER
        return
    end
    % 14 17
    % 15 17
    if isempty(ListViewParameterStruct.Data)
        return
    end
    % 19 21
    if gt(nargin, 2.0)
        TaskObj = varargin{1.0};
    else
        TaskObj = [];
    end
    % 25 28
    % 26 28
    if not(isfield(ListViewParameterStruct, 'Attributes')) || not(isfield(ListViewParameterStruct, 'Data'))
        error('Incorrect parameter specified.');
    end
    % 30 33
    % 31 33
    if iscell(ListViewParameterStruct.Data)
        cacheObj = [];
        for i=1.0:length(ListViewParameterStruct.Data)
            currentObj = ListViewParameterStruct.Data{i};
            if isa(currentObj, 'DAStudio.Object')
                cacheObj = horzcat(cacheObj, currentObj);
            else
                if ishandle(currentObj)
                    cacheObj = horzcat(cacheObj, get_param(currentObj, 'object'));
                else
                    warning('WARNING: Unsupported object type. Can''t display inside into Model Explorer.');
                    return
                end
            end
        end % for
        ListViewParameterStruct.Data = cacheObj;
    end
    if not(isa(me, 'DAStudio.Explorer'))
        me = daexplore(ListViewParameterStruct.Data, ListViewParameterStruct.Attributes, false);
        % 51 53
        hb = awtcreate('com.mathworks.mwswing.MJFrame');
        sfTk = hb.getToolkit;
        screenSize = sfTk.getScreenSize;
        height = screenSize.getHeight;
        width = screenSize.getWidth;
        height = floor(mrdivide(height, 1.5));
        width = floor(mrdivide(width, 1.5));
        me.position = horzcat(0.0, 0.0, width, height);
    else
        oldposition = me.position;
        event.type = 'MEPostHide';
        closeMECallback(me, event);
        me.delete;
        me = daexplore(ListViewParameterStruct.Data, ListViewParameterStruct.Attributes, false);
        me.position = oldposition;
    end
    % 68 71
    % 69 71
    event.type = 'SetActiveTaskObj';
    event.TaskObj = TaskObj;
    closeMECallback(me, event);
    melistener = handle.listener(me, 'MEPostHide', cellhorzcat(@closeMECallback));
    % 74 76
    me.show;
    me.Title = 'Model Advisor  - List Viewer';
    this.ListExplorer = me;
end
function closeMECallback(this, event)
    % 80 82
    persistent activeTaskObj;
    switch event.type
    case 'MEPostHide'
        % 84 86
        if isa(activeTaskObj, 'Simulink.TaskAdvisor')
            if not(isempty(activeTaskObj.MAObj.CheckCellArray{activeTaskObj.MACindex}.ListViewCloseCallback))
                activeTaskObj.MAObj.CheckCellArray{activeTaskObj.MACindex}.ListViewCloseCallback(activeTaskObj);
            end
        end
    case 'SetActiveTaskObj'
        activeTaskObj = event.TaskObj;
    otherwise
        error('unknown event received');
    end
end
