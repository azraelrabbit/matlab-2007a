function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('sigtools');
    % 8 10
    findpackage('sigdatatypes');
    % 10 12
    c = schema.class(pk, 'fvtool', pk.findclass('sigfig'));
    % 12 14
    p = schema.prop(c, 'AnalysisToolbar', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 15 17
    p = schema.prop(c, 'FigureToolbar', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 18 20
    p = schema.prop(c, 'Filters', 'MATLAB array');
    set(p, 'SetFunction', @setfilters, 'GetFunction', @getfilters, 'AccessFlags.Init', 'Off');
    % 21 24
    % 22 24
    p = schema.prop(c, 'Grid', 'on/off');
    set(p, 'SetFunction', cellhorzcat(@setfcn, 'grid'), 'GetFunction', cellhorzcat(@getfcn, 'grid'), 'AccessFlags.Init', 'Off');
    % 25 28
    % 26 28
    p = schema.prop(c, 'Legend', 'on/off');
    set(p, 'SetFunction', cellhorzcat(@setfcn, 'legend'), 'GetFunction', cellhorzcat(@getfcn, 'legend'), 'AccessFlags.Init', 'Off');
    % 29 32
    % 30 32
    p = schema.prop(c, 'DesignMask', 'on/off');
    set(p, 'SetFunction', cellhorzcat(@setfcn, 'displaymask'), 'GetFunction', cellhorzcat(@getfcn, 'displaymask'), 'AccessFlags.Init', 'Off');
    % 33 37
    % 34 37
    % 35 37
    p = schema.prop(c, 'Fs', 'double_vector');
    set(p, 'SetFunction', @setfs, 'GetFunction', @getfs, 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'Off');
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    p = schema.prop(c, 'FsEditable', 'on/off');
    set(p, 'SetFunction', cellhorzcat(@setfcn, 'fseditable'), 'GetFunction', cellhorzcat(@getfcn, 'fseditable'), 'Visible', 'Off');
    % 44 47
    % 45 47
    p = schema.prop(c, 'HostName', 'String');
    set(p, 'Visible', 'Off');
    % 48 50
    if isfdtbxinstalled
        public = 'on';
    else
        public = 'off';
    end
    % 54 56
    findclass(findpackage('dspopts'), 'sosview');
    p = schema.prop(c, 'SOSViewSettings', 'dspopts.sosview');
    set(p, 'SetFunction', @set_sosview, 'GetFunction', @get_sosview, 'AccessFlags.Init', 'Off', 'AccessFlags.PublicGet', public, 'AccessFlags.PublicSet', public);
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    findclass(findpackage('dspdata'), 'maskline');
    p = schema.prop(c, 'SpectralMask', 'dspdata.maskline');
    set(p, 'SetFunction', @set_maskline, 'GetFunction', @get_maskline, 'AccessFlags.Init', 'Off', 'Visible', 'Off');
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    if ~(isfdtbxinstalled)
        set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    end
    % 74 76
    p = vertcat(schema.prop(c, 'Listeners', 'handle.listener vector'), schema.prop(c, 'AnalysisParameterProps', 'schema.prop vector'), schema.prop(c, 'ParameterListeners', 'handle.listener vector'));
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 81 83
    schema.event(c, 'NewPlot');
end
function sosview = set_sosview(this, sosview)
    % 85 88
    % 86 88
    hFVT = getcomponent(this, 'fvtool');
    % 88 90
    set(hFVT, 'sosViewOpts', copy(sosview));
    % 90 92
    setup_sosview_listener(this, sosview);
end
function sosview = get_sosview(this, sosview)
    % 94 98
    % 95 98
    % 96 98
    hFVT = getcomponent(this, 'fvtool');
    % 98 100
    sosview = get(hFVT, 'sosViewOpts');
    if isempty(sosview)
        sosview = dspopts.sosview;
        set(hFVT, 'sosViewOpts', sosview);
    else
        sosview = copy(sosview);
    end
    % 106 108
    setup_sosview_listener(this, sosview);
end
function setup_sosview_listener(this, h)
    % 110 113
    % 111 113
    l = handle.listener(h, horzcat(h.findprop('View'), h.findprop('UserDefinedSections'), h.findprop('SecondaryScaling')), 'PropertyPostSet', @sosview_listener);
    % 113 115
    set(l, 'callbacktarget', this);
    setappdata(this, 'sosview_listener', l);
end
function sosview_listener(this, eventData)
    % 118 121
    % 119 121
    sosview = get(eventData, 'AffectedObject');
    hFVT = getcomponent(this, 'fvtool');
    % 122 124
    set(hFVT, 'sosViewOpts', copy(sosview));
end
function h = set_maskline(this, h)
    % 126 129
    % 127 129
    hFVT = getcomponent(this, 'fvtool');
    % 129 131
    set(hFVT, 'UserDefinedMask', copy(h));
    % 131 133
    setup_maskline_listener(this, h);
end
function h = get_maskline(this, h)
    % 135 138
    % 136 138
    hFVT = getcomponent(this, 'fvtool');
    % 138 140
    h = get(hFVT, 'UserDefinedMask');
    if isempty(h)
        h = dspdata.maskline;
        set(hFVT, 'UserDefinedMask', h);
    else
        h = copy(h);
    end
    % 146 148
    setup_maskline_listener(this, h);
end
function setup_maskline_listener(this, h)
    % 150 153
    % 151 153
    l = handle.listener(h, horzcat(h.findprop('EnableMask'), h.findprop('MagnitudeUnits'), h.findprop('FrequencyVector'), h.findprop('MagnitudeVector')), 'PropertyPostSet', @maskline_listener);
    % 153 156
    % 154 156
    set(l, 'callbacktarget', this);
    setappdata(this, 'maskline_listener', l);
end
function maskline_listener(this, eventData)
    % 159 162
    % 160 162
    maskline = get(eventData, 'AffectedObject');
    hFVT = getcomponent(this, 'fvtool');
    % 163 165
    set(hFVT, 'UserDefinedMask', copy(maskline));
end
function fs = setfs(this, fs)
    % 167 170
    % 168 170
    hFVT = getcomponent(this, 'fvtool');
    % 170 172
    filt = get(hFVT, 'Filters');
    % 172 174
    oldfs = get(this, 'Fs');
    % 174 176
    if eq(length(fs), 1.0)
        if isnan(fs)
            set(filt, 'Fs', 1.0);
        else
            set(filt, 'Fs', fs);
        end
    else
        if ne(length(fs), length(filt))
            error(generatemsgid('lengthMismatch'), 'Sampling Frequency must be a scalar or a vector of the same length as the number of filters in FVTool.');
            % 184 186
        end
        for indx=1.0:length(filt)
            if isnan(fs(indx))
                set(filt(indx), 'Fs', 1.0);
            else
                set(filt(indx), 'Fs', fs(indx));
            end
        end % for
    end
    % 194 196
    if isprop(this, 'NormalizedFrequency')
        set(this, 'NormalizedFrequency', 'Off');
    end
    % 198 200
    if ~(isequal(oldfs, fs)) && isrendered(hFVT)
        draw(hFVT.CurrentAnalysis);
    end
end
function fs = getfs(this, fs)
    % 204 207
    % 205 207
    hFVT = getcomponent(this, 'fvtool');
    % 207 209
    filt = get(hFVT, 'Filters');
    % 209 211
    for indx=1.0:length(filt)
        lfs = get(filt(indx), 'Fs');
        if isempty(lfs)
            fs(indx) = NaN;
        else
            fs(indx) = lfs;
        end
    end % for
end
function out = setfilters(this, out)
    % 220 223
    % 221 223
    hFVT = getcomponent(this, 'fvtool');
    % 223 225
    if ~(iscell(out))
        out = cellhorzcat(out);
    end
    out = this.findfilters(out{:});
    hFVT.setfilter(out);
end
function out = getfilters(this, out)
    % 231 234
    % 232 234
    hFVT = getcomponent(this, 'fvtool');
    % 234 236
    out = get(hFVT.Filters, 'Filter');
    % 236 238
    if ~(iscell(out))
        out = cellhorzcat(out);
    end
end
function out = setfcn(this, out, prop)
    hFVT = getcomponent(this, 'fvtool');
    % 243 245
    hFVT.(prop) = out;
end
function out = getfcn(this, out, prop)
    % 247 250
    % 248 250
    hFVT = getcomponent(this, 'fvtool');
    % 250 252
    out = get(hFVT, prop);
end
