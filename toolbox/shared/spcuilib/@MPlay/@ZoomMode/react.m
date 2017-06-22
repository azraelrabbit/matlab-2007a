function react(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    warnState = warning('off', 'Images:imuitoolsgate:undocumentedFunction');
    % 11 12
    switch h.zoom_mode
    case 'off'
        % 14 17
        % 15 17
        % 16 17
        st_zoomin = 'off';
        st_zoomout = 'off';
        st_panimage = 'off';
        % 20 22
        % 21 22
        fun = [];
        ptr = setptr('arrow');
    case 'inmode'
        % 25 28
        % 26 28
        % 27 28
        st_zoomin = 'on';
        st_zoomout = 'off';
        st_panimage = 'off';
        % 31 33
        % 32 33
        fun = imuitoolsgate('FunctionHandle', 'imzoomin');
        ptr = setptr('glassplus');
    case 'outmode'
        % 36 39
        % 37 39
        % 38 39
        st_zoomin = 'off';
        st_zoomout = 'on';
        st_panimage = 'off';
        % 42 44
        % 43 44
        fun = imuitoolsgate('FunctionHandle', 'imzoomout');
        ptr = setptr('glassminus');
    case 'panmode'
        % 47 48
        st_zoomin = 'off';
        st_zoomout = 'off';
        st_panimage = 'on';
        % 51 53
        % 52 53
        fun = imuitoolsgate('FunctionHandle', 'impan');
        ptr = setptr('hand');
    end % switch
    % 56 59
    % 57 59
    % 58 59
    set(h.zoomin_button, 'state', st_zoomin);
    set(h.zoomout_button, 'state', st_zoomout);
    set(h.panimage_button, 'state', st_panimage);
    set(h.zoomin_menu, 'checked', st_zoomin);
    set(h.zoomout_menu, 'checked', st_zoomout);
    set(h.panimage_menu, 'checked', st_panimage);
    % 65 68
    % 66 68
    % 67 68
    setCurrentModeHandler(h.widgetsObj, fun, ptr);
end % function
function setCurrentModeHandler(widgetsObj, fun, ptr)
    % 71 82
    % 72 82
    % 73 82
    % 74 82
    % 75 82
    % 76 82
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    % 81 82
    hfig = widgetsObj.hfig;
    isJavaFigure = not(isempty(get(hfig, 'JavaFrame')));
    if isJavaFigure
        % 85 86
        hSP = widgetsObj.hScrollPanel;
        if isempty(hSP)
            return;
        end % if
        sp_api = iptgetapi(hSP);
        % 91 93
        % 92 93
        sp_api.setImageButtonDownFcn([])
        % 94 96
        % 95 96
        set(hfig, ptr{:})
        % 97 99
        % 98 99
        sp_api.setImageButtonDownFcn(fun)
    end % if
end % function
