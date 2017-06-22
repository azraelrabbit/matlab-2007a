function thisrender(this, varargin)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    pos = parserenderinputs(this, varargin{:});
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    if not(isempty(pos))
        sz = gui_sizes(this);
        pos = plus(pos, mtimes([60.0 50.0 -130.0 -83.0], sz.pixf));
    end % if
    render_component(this, 'render_axes', pos);
    % 24 27
    % 25 27
    render_component(this, 'render_toolbar');
    % 27 30
    % 28 30
    render_component(this, 'render_analysis_menu', 3.0);
    % 30 33
    % 31 33
    render_component(this, 'render_analysis_toolbar');
    % 33 35
    render_component(this, 'render_viewmenu');
    % 35 38
    % 36 38
    setunits(this, 'Normalized');
    % 38 41
    % 39 41
    attachlisteners(this);
    listeners(this, [], 'postcurrentanalysis_listener');
    listeners(this, [], 'filter_listener');
end % function
function attachlisteners(this)
    % 45 49
    % 46 49
    % 47 49
    h = get(this, 'Handles');
    hhax = handle(h.axes);
    % 50 52
    l = vertcat(handle.listener(this, this.findprop('Filters'), 'PropertyPostSet', cellhorzcat(@listeners, 'filter_listener')), handle.listener(this, horzcat(this.findprop('ShowReference'), this.findprop('PolyphaseView')), 'PropertyPostSet', cellhorzcat(@listeners, 'show_listener')), handle.listener(this, this.findprop('CurrentAnalysis'), 'PropertyPreSet', cellhorzcat(@listeners, 'precurrentanalysis_listener')), handle.listener(this, this.findprop('CurrentAnalysis'), 'PropertyPostSet', cellhorzcat(@listeners, 'postcurrentanalysis_listener')), handle.listener(this, this.findprop('DisplayMask'), 'PropertyPostSet', cellhorzcat(@listeners, 'displaymask_listener')), handle.listener(this, 'NewAnalysis', cellhorzcat(@listeners, 'newanalysis_eventcb')), handle.listener(this, this.findprop('Grid'), 'PropertyPostSet', cellhorzcat(@listeners, 'grid_listener')), handle.listener(this, this.findprop('Legend'), 'PropertyPostSet', cellhorzcat(@listeners, 'legend_listener')), handle.listener(hhax, horzcat(hhax(1.0).findprop('XGrid'), hhax(1.0).findprop('YGrid')), 'PropertyPostSet', cellhorzcat(@listeners, 'axesgrid_listener')), handle.listener(this, this.findprop('FsEditable'), 'PropertyPostSet', cellhorzcat(@listeners, 'fseditable_listener')));
    % 52 75
    % 53 75
    % 54 75
    % 55 75
    % 56 75
    % 57 75
    % 58 75
    % 59 75
    % 60 75
    % 61 75
    % 62 75
    % 63 75
    % 64 75
    % 65 75
    % 66 75
    % 67 75
    % 68 75
    % 69 75
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    set(l, 'CallbackTarget', this);
    set(this, 'WhenRenderedListeners', l);
end % function
