function scribeeventhandler(fig, co, selType)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 1.0)
        fig = gcbf;
    end % if
    if lt(nargin, 2.0)
        co = gcoall(fig);
    end % if
    if lt(nargin, 3.0)
        selType = get(fig, 'SelectionType');
    end % if
    % 15 17
    cbo = co;
    % 17 19
    scribeButtonDownFcn = 'doclick';
    primaryObject = getappdata(co, 'ScribeButtonDownHGObj');
    if not(isempty(primaryObject))
        co = primaryObject;
    end % if
    setappdata(fig, 'ScribeHGCurrentObject', co);
    % 24 26
    MLObj = getorcreateobj(co);
    % 26 28
    if isempty(MLObj)
        return;
    end % if
    % 30 32
    ud = getscribeobjectdata(co);
    % 32 34
    switch selType
    case {'normal','open','extend'}
        setappdata(cbo, 'ScribeSaveFcns', get(cbo, 'ButtonDownFcn'));
        set(cbo, 'ButtonDownFcn', 'scriberestoresavefcns');
        switch get(co, 'Type')
        case 'axes'
            if get(MLObj, 'IsSelected') && get(MLObj, 'Draggable')
                H = ud.HandleStore;
                domethod(H, 'resize');
            else
                if not(isempty(scribeButtonDownFcn))
                    feval(scribeButtonDownFcn, MLObj);
                end % if
            end % if
        otherwise
            if not(isempty(scribeButtonDownFcn))
                feval(scribeButtonDownFcn, MLObj);
            end % if
        end % switch
    case 'alt'
        contextMenu = getscribecontextmenu(co);
        if not(isempty(contextMenu))
            saveFcns = get(co, {'UIContextMenu','ButtonDownFcn'});
            setappdata(contextMenu, 'ScribeSaveFcns', saveFcns);
            set(fig, 'CurrentObject', co);
            set(co, {'UIContextMenu','ButtonDownFcn'}, cellhorzcat(contextMenu, 'doclick(gcbo)'));
            % 59 63
            % 60 63
            % 61 63
            setappdata(contextMenu, 'ScribeOneShotContextMenuFlag', co);
        end % if
    end % switch
