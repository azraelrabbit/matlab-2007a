function listeners(this, eventData, fcn, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    feval(fcn, this, eventData, varargin{:});
end
function analysis_listener(this, eventData)
    % 10 14
    % 11 14
    % 12 14
    tag = get(this, 'Analysis');
    % 14 16
    if isempty(tag)
        newa = [];
    else
        % 18 22
        % 19 22
        % 20 22
        sa = get(this, 'OverlayedAnalysis');
        if isempty(sa)
            newa = getanalysisobject(this);
        else
            try
                newa = buildtworesps(this);
            catch
                set(this, 'OverlayedAnalysis', '');
                return
            end % try
        end
    end
    % 33 35
    set(this, 'CurrentAnalysis', newa);
    % 35 39
    % 36 39
    % 37 39
    if isrendered(this)
        h = get(this, 'Handles');
        set(convert2vector(h.menu.analyses), 'Checked', 'Off');
        set(convert2vector(h.toolbar.analyses), 'State', 'Off');
        if ~(isempty(tag))
            set(h.menu.analyses.(tag), 'Checked', 'On');
            set(h.toolbar.analyses.(tag), 'State', 'On');
        end
    end
    % 47 49
    set(this, 'SubMenuFixed', false);
    % 49 51
    sendfiltrespwarnings(this);
end
function secondanalysis_listener(this, eventData)
    % 53 56
    % 54 56
    s = get(this, 'OverlayedAnalysis');
    if isempty(s)
        analysis_listener(this, eventData);
        s = 'none';
    else
        % 60 62
        try
            % 62 65
            % 63 65
            ht = buildtworesps(this);
            set(this, 'CurrentAnalysis', ht);
        catch
            % 67 70
            % 68 70
            set(this, 'OverlayedAnalysis', '');
            analysis_listener(this, eventData);
            s = 'none';
        end % try
    end
    % 74 76
    if isrendered(this)
        h = get(this, 'Handles');
        % 77 79
        set(h.menu.righthand.(s), 'Checked', 'On');
        set(convert2vector(rmfield(h.menu.righthand, s)), 'Checked', 'Off');
    end
    % 81 84
    % 82 84
    sendfiltrespwarnings(this);
end
function precurrentanalysis_listener(this, eventData)
    % 86 89
    % 87 89
    ca = get(this, 'CurrentAnalysis');
    h = get(this, 'Handles');
    % 90 92
    sendstatus(this, 'Computing Response ...');
    % 92 94
    if ~(isempty(ca))
        % 94 96
        hdlg = get(this, 'ParameterDlg');
        rmcomponent(ca, hdlg);
        delete(ca.WhenRenderedListeners);
        unrender(ca);
    end
    set(horzcat(h.axes, h.listbox), 'Visible', 'Off');
    % 101 103
    set(convert2vector(h.menu.analyses), 'Checked', 'Off');
    set(convert2vector(h.toolbar.analyses), 'State', 'Off');
    % 104 108
    % 105 108
    % 106 108
    newAnalysis = get(eventData, 'NewValue');
    if isprop(newAnalysis, 'DisplayMask')
        set(newAnalysis, 'DisplayMask', this.DisplayMask);
    end
end
function postcurrentanalysis_listener(this, eventData)
    % 113 117
    % 114 117
    % 115 117
    ca = get(this, 'CurrentAnalysis');
    h = get(this, 'Handles');
    % 118 120
    tag = get(this, 'Analysis');
    % 120 122
    if isempty(tag)
        return
    end
    set(h.menu.analyses.(tag), 'Checked', 'On');
    set(h.toolbar.analyses.(tag), 'State', 'On');
    % 126 128
    if isempty(ca)
        enabState = 'Off';
        l = [];
    else
        % 131 133
        l = vertcat(handle.listener(ca, 'NewPlot', cellhorzcat(@listeners, 'newplot_listener')), handle.listener(ca, ca.findprop('Legend'), 'PropertyPostSet', @analysislegend_listener));
        % 133 138
        % 134 138
        % 135 138
        % 136 138
        set(l, 'CallbackTarget', this);
        % 138 141
        % 139 141
        set(ca, 'FastUpdate', this.FastUpdate, 'Filters', this.Filters, 'ShowReference', this.ShowReference, 'PolyphaseView', this.PolyphaseView, 'SOSViewOpts', this.SOSViewOpts);
        % 141 146
        % 142 146
        % 143 146
        % 144 146
        if isa(ca, 'sigresp.analysisaxis')
            set(ca, 'Legend', this.Legend, 'Grid', this.Grid);
            if isprop(ca, 'UserDefinedMask')
                set(ca, 'UserDefinedMask', this.UserDefinedMask);
            end
            render(ca, h.axes);
            enabState = 'On';
        else
            if isa(ca, 'sigresp.listboxanalysis')
                render(ca, h.listbox);
                enabState = 'Off';
            else
                render(ca, horzcat(h.axes, h.listbox));
                enabState = 'Off';
            end
        end
        set(ca, 'Visible', this.Visible);
    end
    hdlg = get(this, 'ParameterDlg');
    if ~(isempty(hdlg))
        % 165 167
        if isempty(ca)
            set(hdlg, 'Parameters', [], 'Label', 'Analysis Parameters');
        else
            if isrendered(hdlg)
                setupparameterdlg(ca, hdlg);
                cshelpcontextmenu(hdlg.FigureHandle, handles2vector(hdlg), 'fvtool_analysis_parameters', 'FDATool');
                % 172 174
            end
        end
    end
    % 176 180
    % 177 180
    % 178 180
    hview = h.menu.view;
    he = horzcat(hview.grid, hview.legend);
    set(he, 'Enable', enabState);
    % 182 184
    set(this, 'CurrentAnalysisListener', l);
    % 184 186
    displaymask_listener(this, eventData);
    % 186 188
    sendstatus(this, 'Computing Response ... done');
    % 188 190
    sendfiltrespwarnings(this);
    updatezoommenus(this);
end
function filter_listener(this, eventData)
    % 193 197
    % 194 197
    % 195 197
    aInfo = get(this, 'AnalysesInfo');
    fn = fieldnames(aInfo);
    fn = setdiff(fn, 'tworesps');
    h = get(this, 'Handles');
    % 200 203
    % 201 203
    for indx=1.0:length(fn)
        if ~(isempty(aInfo.(fn{indx}).check)) && ~(feval(aInfo.(fn{indx}).check, this.Filters))
            % 204 207
            % 205 207
            set(horzcat(h.toolbar.analyses.(fn{indx}), h.menu.analyses.(fn{indx})), 'Enable', 'Off');
            % 207 210
            % 208 210
            if strcmpi(this.Analysis, fn{indx})
                set(this, 'Analysis', 'magnitude');
            end
        else
            set(horzcat(h.toolbar.analyses.(fn{indx}), h.menu.analyses.(fn{indx})), 'Enable', 'On');
        end
    end % for
    % 216 218
    set(this, 'SubMenuFixed', false);
    fix_submenu(this);
end
function analysislegend_listener(this, eventData)
    % 221 224
    % 222 224
    set(this, 'Legend', get(this.CurrentAnalysis, 'Legend'));
end
function show_listener(this, eventData)
    % 226 229
    % 227 229
    h = get(this, 'Handles');
    % 229 233
    % 230 233
    % 231 233
    set(h.menu.view.showreference, 'Checked', get(this, 'ShowReference'));
    set(h.menu.view.polyphaseview, 'Checked', get(this, 'PolyphaseView'));
end
function newanalysis_eventcb(this, eventData)
    % 236 241
    % 237 241
    % 238 241
    % 239 241
    tag = get(eventData, 'Data');
    % 241 244
    % 242 244
    render_component(this, 'render_analysis_button', tag);
    render_component(this, 'render_analysis_menuitem', tag);
end
function newplot_listener(this, eventData)
    % 247 250
    % 248 250
    displaymask_listener(this, eventData)
    updatezoommenus(this);
    send(this, 'NewPlot', eventData);
end
function displaymask_listener(this, eventData)
    % 254 257
    % 255 257
    ha = get(this, 'CurrentAnalysis');
    h = get(this, 'Handles');
    % 258 260
    if isempty(ha) || ~(enablemask(ha))
        enabState = 'Off';
    else
        enabState = 'On';
    end
    % 264 266
    set(h.menu.view.displaymask, 'Enable', enabState, 'Checked', this.DisplayMask);
end
function legend_listener(this, eventData)
    % 268 271
    % 269 271
    h = get(this, 'Handles');
    % 271 273
    visState = get(this, 'Legend');
    % 273 276
    % 274 276
    if isfield(h.toolbar, 'legend')
        set(h.toolbar.legend, 'State', visState);
    end
    set(h.menu.view.legend, 'Checked', visState);
end
function grid_listener(this, eventData)
    % 281 284
    % 282 284
    grid = get(this, 'Grid');
    % 284 286
    h = get(this, 'Handles');
    % 286 288
    set(h.menu.view.grid, 'Checked', grid);
    % 288 290
    if isfield(h.toolbar, 'grid')
        set(h.toolbar.grid, 'State', grid);
    end
end
function fseditable_listener(this, eventData)
    % 294 297
    % 295 297
    fse = get(this, 'FsEditable');
    % 297 299
    h = get(this, 'Handles');
    % 299 301
    hfs = h.menu.params.fs;
    % 301 303
    set(hfs(ishandle(hfs)), 'Visible', fse);
    % 303 305
    hdlg = getcomponent(this, '-class', 'siggui.dfiltwfsdlg');
    if ~(isempty(h))
        set(hdlg, 'Enable', fse, 'Filters', get(this, 'Filter'));
    end
end
function axesgrid_listener(this, eventData)
    % 310 313
    % 311 313
    set(this, 'Grid', get(eventData, 'NewValue'));
end
function ht = buildtworesps(this)
    % 315 319
    % 316 319
    % 317 319
    f = get(this, 'Analysis');
    s = get(this, 'OverlayedAnalysis');
    % 320 322
    ht = getanalysisobject(this, 'tworesps');
    ha = getanalysisobject(this, f, 'new');
    ha(2.0) = getanalysisobject(this, s, 'new', getxaxisparams(ha));
    % 324 326
    set(ht, 'Analyses', ha);
end
function updatezoommenus(this, varargin)
    % 328 331
    % 329 331
    ca = get(this, 'CurrentAnalysis');
    % 331 333
    passEnab = 'Off';
    stopEnab = 'Off';
    % 334 336
    isqfilt = false;
    % 336 338
    if ~(isempty(ca))
        Hd = get(ca.Filters, 'Filter');
        if iscell(Hd)
            for indx=1.0:length(Hd)
                if isa(Hd{indx}, 'qfilt')
                    isqfilt = true;
                end
            end % for
        else
            isqfilt = isa(Hd, 'qfilt');
        end
        if isqfilt
            x = NaN;
            y = NaN;
        else
            if iscell(Hd)
                Hd = horzcat(Hd{:});
            end
            if isempty(Hd)
                x = NaN;
                y = NaN;
            else
                for indx=1.0:length(Hd)
                    hdesign = getfdesign(Hd(indx));
                    hmethod = getfmethod(Hd(indx));
                    if isempty(hdesign) || isempty(hmethod)
                        x = NaN;
                        y = NaN;
                    else
                        if ~(haspassbandzoom(hdesign))
                            x = NaN;
                            y = NaN;
                        else
                            x = 1.0;
                            y = 1.0;
                        end
                    end
                end % for
            end
        end
        if ~(any(horzcat(isnan(x), isnan(y)))) && isa(ca, 'filtresp.magnitude')
            passEnab = 'On';
        else
            if enablemask(ca) && eq(length(Hd), 1.0) && isprop(Hd, 'MaskInfo')
                mi = get(Hd, 'MaskInfo');
                bands = mi.bands;
                for indx=1.0:length(bands)
                    if isfield(bands{indx}, 'magfcn')
                        switch bands{indx}.magfcn
                        case {'cpass','pass','wpass'}
                            passEnab = 'On';
                        case {'wstop','stop'}
                            stopEnab = 'On';
                        end
                    end
                end % for
            end
        end
    end
    h = get(this, 'Handles');
    set(h.menu.view.passband, 'Enable', passEnab);
    set(h.menu.view.stopband, 'Enable', stopEnab);
end
