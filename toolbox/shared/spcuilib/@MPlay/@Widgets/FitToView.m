function FitToView(widgetsObj, newMag)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    isJavaFigure = not(isempty(get(widgetsObj.hfig, 'JavaFrame')));
    if isJavaFigure
        % 12 13
        hSP = widgetsObj.hScrollPanel;
        if isempty(hSP)
            return;
        end % if
        sp_api = iptgetapi(hSP);
        % 18 21
        % 19 21
        % 20 21
        FitToView = widgetsObj.FitToViewState;
        % 22 25
        % 23 25
        % 24 25
        if FitToView
            state = 'on';
        else
            state = 'off';
        end % if
        set(widgetsObj.options_toolbar.fit_to_view, 'state', state);
        set(widgetsObj.hmenus.fit_to_view, 'checked', state);
        % 32 35
        % 33 35
        % 34 35
        mplayObj = get(widgetsObj.hfig, 'userdata');
        if FitToView
            % 37 40
            % 38 40
            % 39 40
            if isEmptyData(mplayObj.datasourceObj.dataSource)
                newMag = 1.0;
            else
                newMag = sp_api.findFitMag();
            end % if
            % 45 47
            % 46 47
            cb_ena = false;
            % 48 50
            % 49 50
            mplayObj.ZoomEnable('off');
        else
            % 52 57
            % 53 57
            % 54 57
            % 55 57
            % 56 57
            if lt(nargin, 2.0)
                % 58 59
                if not(isempty(widgetsObj.hMagCombo))
                    lastMag = sp_api.getMagnification();
                    % 61 62
                    if le(lastMag, 0.0)
                        lastMag = 1.0;
                    end % if
                else
                    lastMag = 1.0;
                end % if
                newMag = lastMag;
            end % if
            % 70 72
            % 71 72
            cb_ena = true;
            % 73 75
            % 74 75
            mplayObj.ZoomEnable('on');
        end % if
        % 77 79
        % 78 79
        sp_api.setMagnification(newMag);
        % 80 85
        % 81 85
        % 82 85
        % 83 85
        % 84 85
        awtinvoke(widgetsObj.hMagCombo, 'setEnabled(Z)', cb_ena);
    else
        % 87 89
        % 88 89
        [local_frameRows, local_frameCols] = size(get(widgetsObj.himage, 'cdata'));
        set(widgetsObj.himage, 'xdata', 1.0:local_frameCols, 'ydata', 1.0:local_frameRows);
        % 91 93
        % 92 93
    end % if
end % function
