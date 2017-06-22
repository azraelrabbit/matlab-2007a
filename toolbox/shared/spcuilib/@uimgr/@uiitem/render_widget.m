function render_widget(h)
    % 1 30
    % 2 30
    % 3 30
    % 4 30
    % 5 30
    % 6 30
    % 7 30
    % 8 30
    % 9 30
    % 10 30
    % 11 30
    % 12 30
    % 13 30
    % 14 30
    % 15 30
    % 16 30
    % 17 30
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    WidgetFcn = h.WidgetFcn;
    if ~(isempty(WidgetFcn))
        % 31 37
        % 32 37
        % 33 37
        % 34 37
        % 35 37
        if ~(isRendered(h))
            % 37 50
            % 38 50
            % 39 50
            % 40 50
            % 41 50
            % 42 50
            % 43 50
            % 44 50
            % 45 50
            % 46 50
            % 47 50
            % 48 50
            theWidget = WidgetFcn(h);
            h.hWidget = theWidget;
            widgetObj = handle(theWidget);
            % 52 85
            % 53 85
            % 54 85
            % 55 85
            % 56 85
            % 57 85
            % 58 85
            % 59 85
            % 60 85
            % 61 85
            % 62 85
            % 63 85
            % 64 85
            % 65 85
            % 66 85
            % 67 85
            % 68 85
            % 69 85
            % 70 85
            % 71 85
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
            pv_pairs = horzcat(h.WidgetProperties, h.RenderCache, h.CustomRenderCache);
            % 85 91
            % 86 91
            % 87 91
            % 88 91
            % 89 91
            params = {'Visible','Enable','Separator'};
            for i=1.0:numel(params)
                p_i = params{i};
                if ~(isempty(findprop(widgetObj, p_i)))
                    pv_pairs = horzcat(pv_pairs, cellhorzcat(p_i, h.(p_i)));
                end
            end % for
            % 97 100
            % 98 100
            if ~(isempty(pv_pairs))
                set(theWidget, pv_pairs{:});
            end
            % 102 112
            % 103 112
            % 104 112
            % 105 112
            % 106 112
            % 107 112
            % 108 112
            % 109 112
            % 110 112
            if isempty(findprop(widgetObj, 'UIMgr'))
                schema.prop(widgetObj, 'UIMgr', 'uimgr.uiitem');
                widgetObj.UIMgr = h;
            end
            % 115 120
            % 116 120
            % 117 120
            % 118 120
            if ~(isempty(h.SyncList))
                installSyncListeners(h.SyncList, h);
            end
            % 122 126
            % 123 126
            % 124 126
        end
    end
end
