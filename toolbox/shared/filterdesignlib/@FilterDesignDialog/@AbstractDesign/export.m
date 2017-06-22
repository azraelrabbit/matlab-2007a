function export(this, hdlg, method, warnflag, warnstr)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    if eq(warnflag, true) && lclHasUnappliedChanges(this, hdlg)
        % 12 14
        question = sprintf('%s%s%s%s%s', 'There are unapplied changes in the design specifications.  ', 'Apply the changes before ', warnstr, '?');
        % 14 18
        % 15 18
        % 16 18
        choice = questdlg(question, getDialogTitle(this), 'Yes', 'No', 'Cancel', 'Yes');
        % 18 21
        % 19 21
        switch lower(choice)
        case 'yes'
            hdlg.apply;
        case 'cancel'
            return
        end
    end
    % 27 30
    % 28 30
    feval(method, this);
end
function launchfvtool(this)
    % 32 35
    % 33 35
    hfvt = get(this, 'FVTool');
    if ~(isempty(hfvt)) && isa(hfvt, 'sigtools.fvtool')
        figure(hfvt);
        return
    end
    % 39 41
    Hd = get(this, 'LastAppliedFilter');
    % 41 43
    if isempty(Hd)
        % 43 46
        % 44 46
        Hd = design(this);
    end
    % 47 49
    normFlag = get(Hd.getfdesign, 'NormalizedFrequency');
    if normFlag
        normFlag = 'on';
    else
        normFlag = 'off';
    end
    % 54 56
    hfvt = fvtool(Hd, 'NormalizedFrequency', normFlag);
    % 56 58
    l = handle.listener(this, 'DialogApplied', @(h,ed)refresh_fvtool(this,hfvt));
    setappdata(hfvt, 'DialogAppliedListener', l);
    % 59 61
    set(this, 'FVTool', hfvt);
end
function hdl(this)
    % 63 66
    % 64 66
    hhdl = get(this, 'HDLDialog');
    if ~(isempty(hhdl)) && isa(hhdl, 'hdlgui.vhdldlg')
        if isrendered(hhdl)
            set(hhdl, 'Visible', 'On');
            figure(hhdl.FigureHandle);
            return
        else
            % 72 76
            % 73 76
            % 74 76
            refresh_hdldlg(this, hhdl);
            % 76 78
            render(hhdl);
            set(hhdl, 'Visible', 'On');
        end
    else
        % 81 83
        Hd = get(this, 'LastAppliedFilter');
        % 83 85
        if isempty(Hd)
            % 85 88
            % 86 88
            Hd = design(this);
        end
        % 89 91
        hhdl = hdlgui.createhdldlg(Hd);
        % 91 95
        % 92 95
        % 93 95
        set(hhdl.getcomponent('tag', 'hdlgui.language'), 'Name', this.VariableName);
        set(hhdl.getcomponent('tag', 'hdlgui.vhdltestbench'), 'TestBenchName', sprintf('%s_tb', this.VariableName));
        % 96 101
        % 97 101
        % 98 101
        % 99 101
        set(this, 'HDLDialog', hhdl);
    end
    % 102 104
    l = handle.listener(this, 'DialogApplied', @(h,ed)refresh_hdldlg(this,hhdl));
    setappdata(hhdl.FigureHandle, 'DialogAppliedListener', l);
end
function refresh_hdldlg(this, hhdl)
    % 107 110
    % 108 110
    Hd = design(this);
    % 110 112
    hhdl.updatefilter(Hd);
end
function refresh_fvtool(this, hfvt)
    % 114 117
    % 115 117
    Hd = design(this);
    % 117 119
    set(hfvt, 'Filters', Hd);
end
function b = lclHasUnappliedChanges(this, hdlg)
    % 121 124
    % 122 124
    if isempty(hdlg)
        b = false;
        return
    end
    % 127 129
    b = hdlg.hasUnappliedChanges;
    % 129 131
    if b
        oldSpecs = get(this, 'LastAppliedState');
        newSpecs = getState(this);
        % 133 135
        b = ~(isequal(oldSpecs, newSpecs));
    end
end
function mcode(this)
    % 138 142
    % 139 142
    % 140 142
    [file, path] = uiputfile('*.m', 'Generate M-file', 'untitled.m');
    if isequal(file, 0.0)
        return
    end
    % 145 147
    file = fullfile(path, file);
    if isempty(strfind(file, '.'))
        file = horzcat(file, '.m');
    end
    % 150 153
    % 151 153
    mcodebuffer = getMCodeBuffer(this);
    % 153 156
    % 154 156
    opts.H1 = 'Returns a discrete-time filter object.';
    opts.outputargs = 'Hd';
    % 157 160
    % 158 160
    genmcode(file, mcodebuffer, opts);
    % 160 163
    % 161 163
    edit(file);
end
function block(this)
    % 165 168
    % 166 168
    hdsp = get(this, 'DSPFWIZ');
    if isempty(hdsp) || ~(isa(hdsp, 'siggui.dspfwiz'))
        % 169 171
        Hd = get(this, 'LastAppliedFilter');
        % 171 173
        if isempty(Hd)
            % 173 176
            % 174 176
            Hd = design(this);
        end
        hdsp = siggui.dspfwiz(Hd);
        set(this, 'DSPFWIZ', hdsp);
    end
    % 180 182
    dialog(hdsp);
    % 182 184
    l = handle.listener(this, 'DialogApplied', @(h,ed)refresh_dspfwizdlg(this,hdsp));
    setappdata(hdsp.FigureHandle, 'DialogAppliedListener', l);
end
function refresh_dspfwizdlg(this, hdsp)
    % 187 190
    % 188 190
    Hd = design(this);
    % 190 192
    set(hdsp, 'Filter', Hd);
end
