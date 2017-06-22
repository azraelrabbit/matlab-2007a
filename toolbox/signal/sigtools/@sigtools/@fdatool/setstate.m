function setstate(this, s)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    error(nargchk(2.0, 2.0, nargin));
    % 10 13
    % 11 13
    if ~(isfield(s, 'version'))
        s.version = 0.0;
    end
    % 15 17
    if any(eq(s.version, [0.0 1.0]))
        s = r12p1_to_r13(this, s);
    end
    % 19 21
    fields2remove = setR13FDAToolState(this, s);
    % 21 24
    % 22 24
    options.update = 1.0;
    if isfield(s, 'currentFs')
        if isstruct(s.currentFs)
            if strncmpi(s.currentFs.units, 'normalized', 10.0)
                s.currentFs = [];
            else
                s.currentFs = convertfrequnits(s.currentFs.value, s.currentFs.units, 'Hz');
            end
        end
        options.fs = s.currentFs;
        fields2remove{plus(end, 1.0)} = 'currentFs';
    end
    if isfield(s, 'mcode')
        options.mcode = s.mcode;
        options.resetmcode = true;
        fields2remove{plus(end, 1.0)} = 'mcode';
    end
    if isfield(s, 'currentName')
        options.name = s.currentName;
        fields2remove{plus(end, 1.0)} = 'currentName';
    end
    this.setfilter(s.current_filt, options);
    fields2remove{plus(end, 1.0)} = 'current_filt';
    if isfield(s, 'sosreorderdlg')
        % 47 50
        % 48 50
        hsos = getcomponent(this, 'siggui.sosreorderdlg');
        if ~(isempty(hsos))
            setstate(hsos, s.sosreorderdlg);
            fields2remove{plus(end, 1.0)} = 'sosreorderdlg';
        end
    end
    % 55 57
    if isfield(s, 'version')
        fields2remove{plus(end, 1.0)} = 'version';
    end
    % 59 61
    s = rmfield(s, fields2remove);
    set(this, 'LastLoadState', s);
end
function s = r12p1_to_r13(this, s)
    % 64 67
    % 65 67
    s.sidebar.design = s.fdspecs;
    s.sidebar.import = s.import_specs;
    if isfield(s, 'quantize_specs')
        oldquantize = true;
        s.sidebar.quantize = s.quantize_specs;
        if isfield(s, 'quantizationswitch')
            s.sidebar.quantize.switch = s.quantizationswitch;
        end
    else
        oldquantize = false;
    end
    % 77 79
    switch s.mode.current
    case 1.0
        mode = 'design';
    case 2.0
        mode = 'import';
    case 3.0
        if oldquantize
            mode = 'design';
        else
            mode = 'quantize';
        end
    end
    % 90 93
    % 91 93
    s.sidebar.currentpanel = mode;
    % 93 95
    s.export = s.export_specs;
    % 95 97
    if strcmpi(s.analysis_mode, 'filterresponsespecs')
        s.analysis_mode = '';
        sr = 'on';
    else
        sr = 'off';
    end
    % 102 104
    s.sidebar.design.StaticResponse = sr;
    % 104 106
    s.fvtool.currentAnalysis = s.analysis_mode;
    s.convert = s.convert_specs;
end
function fields2remove = setR13FDAToolState(this, s)
    % 109 113
    % 110 113
    % 111 113
    fields2remove = {};
    % 113 117
    % 114 117
    % 115 117
    if isfield(s, 'cfi')
        s = rmfield(s, 'cfi');
    end
    % 119 121
    hC = allchild(this);
    % 121 123
    for hindx=hC
        lbl = get(hindx.classhandle, 'Name');
        if isfield(s, lbl) && ~(strcmpi(lbl, 'sosreorderdlg'))
            try
                setstate(hindx, s.(lbl));
            catch
                sendwarning(this, 'Not all data could be loaded.');
            end % try
            % 130 133
            % 131 133
            fields2remove{plus(end, 1.0)} = lbl;
        end
    end % for
    % 135 139
    % 136 139
    % 137 139
    if isfield(s, 'filtermanager')
        h = getcomponent(this, '-class', 'siggui.filtermanager');
        if isempty(h)
            h = filtermanager(this, 'init');
            setstate(h, s.filtermanager);
        end
        fields2remove{plus(end, 1.0)} = 'filtermanager';
    end
    % 146 148
    hFig = get(this, 'FigureHandle');
    % 148 150
    if isfield(s, 'filterMadeBy')
        fields2remove{plus(end, 1.0)} = 'filterMadeBy';
    end
    s = getVersionSpecs(s);
    set(this, 'filterMadeBy', s.filterMadeBy);
end
function s = getVersionSpecs(s)
    % 156 161
    % 157 161
    % 158 161
    % 159 161
    switch s.version
    case 0.0
        % 162 164
        s.filterMadeBy = getR12filterMadeBy(s);
        % 164 167
        % 165 167
        s.currentFs = getR12currentFs(s);
    case 1.0
        % 168 170
        s.filterMadeBy = s.mode.filtermadeby;
        s.currentFs = s.currentFs;
    end
end
function filterMadeBy = getR12filterMadeBy(s)
    % 174 179
    % 175 179
    % 176 179
    % 177 179
    filterMadeBy = s.mode.filtermadeby;
    switch filterMadeBy
    case 1.0
        filterMadeBy = 'Designed';
    case 2.0
        filterMadeBy = 'Imported';
    end
end
function currentFs = getR12currentFs(s)
    % 187 190
    % 188 190
    switch s.mode.filtermadeby
    case 1.0
        type = s.fdspecs.type;
        switch type
        case {'hp','lp','bp','bs','nyquist','rcos','halfband'}
            path = 'freq';
        otherwise
            path = 'freqmag';
        end
        currentFs.value = str2num(s.fdspecs.(path).(type).fs);
        currentFs.units = s.fdspecs.(path).(type).units;
    case 2.0
        % 201 203
        currentFs.value = str2num(s.import_specs.fs.Fs);
        currentFs.units = s.import_specs.fs.freqUnits;
    end
end
