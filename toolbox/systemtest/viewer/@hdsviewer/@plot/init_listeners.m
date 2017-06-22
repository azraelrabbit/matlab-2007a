function init_listeners(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    AxGrid = this.AxesGrid;
    container = AxGrid.Parent;
    % 7 9
    L = vertcat(handle.listener(AxGrid, 'ObjectBeingDestroyed', @LocalDelete), handle.listener(this, 'ObjectBeingDestroyed', @LocalCleanUp), handle.listener(AxGrid, 'DataChanged', @LocalRedraw), handle.listener(this, this.findprop('Visible'), 'PropertyPostSet', @LocalRefreshPlot), handle.listener(container, container.findprop('Visible'), 'PropertyPostSet', @LocalRefreshPlot));
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    set(L, 'CallbackTarget', this);
    % 16 19
    % 17 19
    presavelistener = handle.listener(ancestor(container, 'hg.figure'), 'SerializeEvent', cellhorzcat(@LocalPrePostSave, this));
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    this.Listeners = vertcat(L, presavelistener);
end
function LocalPrePostSave(src, eventdata, this)
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    if strcmp(get(eventdata, 'Preserialize'), 'on')
        % 35 37
        cp = findall(src, 'type', 'line', 'tag', 'CharPoint');
        % 37 41
        % 38 41
        % 39 41
        set(cp, 'HandleVisibility', 'on');
        this.SaveData.CharPoints = cp;
        % 42 45
        % 43 45
        this.SaveData.data = uiclearmode(src, 'docontext');
        this.SaveData.cached_closereq = src.CloseRequestFcn;
        this.SaveData.Appdata = getappdata(src);
        % 47 50
        % 48 50
        hggroups = findobj(src, 'type', 'hggroup');
        hggroupappdata = cell(numel(hggroups), 1.0);
        for k=1.0:length(hggroups)
            hggroupappdata{k} = getappdata(hggroups(k));
            appdatafields = fields(hggroupappdata{k});
            % 54 57
            % 55 57
            for j=1.0:length(appdatafields)
                if ~(any(strcmp(appdatafields{j}, {'LegendLegendInfo','LegendLegendInfoStruct'})))
                    rmappdata(hggroups(k), appdatafields{j});
                end
            end % for
        end % for
        this.SaveData.HGGroupData = hggroupappdata;
        % 63 66
        % 64 66
        appDataFields = fields(this.SaveData.Appdata);
        for k=1.0:length(appDataFields)
            rmappdata(src, appDataFields{k});
        end % for
        % 69 72
        % 70 72
        src.CloseRequestFcn = 'closereq';
        set(src, 'windowStyle', 'normal')
        % 73 76
        % 74 76
        set(src, 'HandleVisibility', 'on');
        % 76 79
        % 77 79
        hdsviewer.utBaseFigureMenus(src);
    else
        % 80 82
        set(src, 'windowStyle', 'docked', 'HandleVisibility', 'callback');
        hggroups = findobj(src, 'type', 'hggroup');
        for k=1.0:length(this.SaveData.HGGroupData)
            appdatafields = fields(this.SaveData.HGGroupData{k});
            for j=1.0:length(appdatafields)
                setappdata(hggroups(k), appdatafields{j}, this.SaveData.HGGroupData{k}.(appdatafields{j}));
                % 87 89
            end % for
        end % for
        % 90 93
        % 91 93
        appDataFields = fields(this.SaveData.Appdata);
        for k=1.0:length(appDataFields)
            setappdata(src, appDataFields{k}, this.SaveData.Appdata.(appDataFields{k}));
        end % for
        % 96 102
        % 97 102
        % 98 102
        % 99 102
        % 100 102
        uirestore(this.SaveData.data);
        % 102 104
        set(this.SaveData.CharPoints, 'HandleVisibility', 'off');
        % 104 106
        src.CloseRequestFcn = this.SaveData.cached_closereq;
        this.SaveData = [];
        % 107 110
        % 108 110
        hdsviewer.utDesktopFigureMenus(src, class(getappdata(src, 'Waveplot')));
    end
end
function LocalRefreshPlot(this, eventdata)
    % 113 120
    % 114 120
    % 115 120
    % 116 120
    % 117 120
    % 118 120
    AxGrid = this.AxesGrid;
    if strcmp(this.Visible, 'off')
        % 121 124
        % 122 124
        AxGrid.Visible = 'off';
    else
        % 125 128
        % 126 128
        refresh(this)
        % 128 131
        % 129 131
        AxGrid.LimitManager = 'off';
        AxGrid.Visible = 'on';
        AxGrid.LimitManager = 'on';
        % 133 136
        % 134 136
        draw(this)
    end
end
function LocalDelete(this, eventdata)
    % 139 144
    % 140 144
    % 141 144
    % 142 144
    delete(this(ishandle(this)))
end
function LocalCleanUp(this, eventdata)
    % 146 151
    % 147 151
    % 148 151
    % 149 151
    delete(this.AxesGrid(ishandle(this.AxesGrid)))
    wfs = allwaves(this);
    delete(wfs(ishandle(wfs)))
end
function LocalRedraw(this, eventdata)
    % 155 162
    % 156 162
    % 157 162
    % 158 162
    % 159 162
    % 160 162
    setlabels(this.AxesGrid)
    % 162 164
    draw(this)
end
