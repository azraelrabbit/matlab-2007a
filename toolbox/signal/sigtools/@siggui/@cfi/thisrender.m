function thisrender(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pos = parserenderinputs(this, varargin{:});
    sz = gui_sizes(this);
    if isempty(pos)
        pos = mtimes([10.0 10.0 178.0 176.0], sz.pixf);
    end
    % 12 15
    % 13 15
    hFig = get(this, 'Parent');
    % 15 17
    hPanel = uipanel('Parent', hFig, 'Units', 'Pixels', 'Position', pos, 'Visible', 'Off', 'Title', 'Current Filter Information');
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    lbls = {'Structure:','Order:','Stable:','Source:'};
    tags = {'structure','order','stable','source'};
    h = get(this, 'Handles');
    % 25 27
    spacing = mrdivide(minus(pos(4.0), mtimes(length(lbls), sz.uh)), 2.0);
    % 27 29
    x = minus(sz.hfus, mtimes(3.0, sz.pixf));
    y = minus(pos(4.0), spacing);
    w = largestuiwidth(lbls);
    ht = sz.uh;
    % 32 34
    for indx=1.0:length(lbls)
        y = minus(y, sz.uh);
        h.(horzcat(tags{indx}, '_lbl')) = uicontrol(hPanel, 'Style', 'Text', 'Tag', tags{indx}, 'HorizontalAlignment', 'Left', 'ForegroundColor', [0.0 0.0 1.0], 'Position', horzcat(x, y, w, ht), 'String', lbls{indx});
        % 36 43
        % 37 43
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        h.(tags{indx}) = uicontrol(hPanel, 'Style', 'Text', 'Tag', tags{indx}, 'HorizontalAlignment', 'Left', 'Position', horzcat(minus(plus(plus(x, w), sz.uuhs), mtimes(4.0, sz.pixf)), y, plus(minus(minus(minus(pos(3.0), w), sz.uuhs), mtimes(2.0, sz.hfus)), mtimes(8.0, sz.pixf)), ht));
        % 43 48
        % 44 48
        % 45 48
        % 46 48
    end % for
    % 48 50
    set(convert2vector(h), 'Units', 'Pixels');
    % 50 52
    set(this, 'Handles', h, 'Container', hPanel);
    % 52 54
    cshelpcontextmenu(this, 'fdatool_currentfilterinfo_frame');
    % 54 58
    % 55 58
    % 56 58
    listener = vertcat(handle.listener(this, this.findprop('Filter'), 'PropertyPostSet', @update), handle.listener(this, this.findprop('Source'), 'PropertyPostSet', @source_listener));
    % 58 66
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    set(listener, 'CallbackTarget', this);
    % 66 69
    % 67 69
    set(this, 'WhenRenderedListeners', listener);
    % 69 71
    update(this);
    source_listener(this);
end
function update(this, eventData)
    % 74 78
    % 75 78
    % 76 78
    h = get(this, 'Handles');
    Hd = get(this, 'Filter');
    % 79 81
    if isempty(Hd)
        stable = 'Yes';
        color = [0.0 0.0 0.0];
        set(h.order, 'String', '50');
        set(h.structure, 'String', 'Direct-Form FIR');
    else
        % 86 88
        setuplayout(this);
        % 88 90
        if isstable(Hd)
            stable = 'Yes';
            color = [0.0 0.0 0.0];
        else
            stable = 'No';
            color = [1.0 0.0 0.0];
        end
    end
    % 97 99
    set(h.stable, 'Foregroundcolor', color, 'String', stable);
end
function setuplayout(this)
    % 101 104
    % 102 104
    sz = gui_sizes(this);
    hp = get(this, 'Container');
    h = get(this, 'Handles');
    Hd = get(this, 'Filter');
    % 107 109
    ht = minus(sz.uh, mtimes(2.0, sz.pixf));
    % 109 111
    hLayout = get(this, 'Layout');
    if isempty(hLayout)
        hLayout = siglayout.gridbaglayout(hp, 'VerticalWeights', [2.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 3.0], 'HorizontalWeights', [0.0 1.0], 'HorizontalGap', mtimes(5.0, sz.pixf));
        % 113 118
        % 114 118
        % 115 118
        % 116 118
        hLayout.add(h.source_lbl, 9.0, 1.0, 'MinimumWidth', largestuiwidth(h.source_lbl), 'Anchor', 'North', 'BottomInset', mtimes(10.0, sz.pixf), 'Fill', 'Both');
        % 118 124
        % 119 124
        % 120 124
        % 121 124
        % 122 124
        hLayout.add(h.source, 9.0, 2.0, 'Anchor', 'North', 'BottomInset', mtimes(10.0, sz.pixf), 'Fill', 'Both');
        % 124 129
        % 125 129
        % 126 129
        % 127 129
        hLayout.add(h.stable_lbl, 8.0, 1.0, 'MinimumWidth', largestuiwidth(h.stable_lbl), 'MinimumHeight', ht, 'Fill', 'Horizontal');
        % 129 134
        % 130 134
        % 131 134
        % 132 134
        hLayout.add(h.stable, 8.0, 2.0, 'MinimumHeight', ht, 'Fill', 'Horizontal');
        % 134 138
        % 135 138
        % 136 138
        set(this, 'Layout', hLayout);
    end
    % 139 141
    fi = cfi(Hd);
    % 141 143
    labels = fieldnames(fi);
    % 143 145
    oldgrid = get(hLayout, 'Grid');
    % 145 147
    oldgrid([8.0 9.0], :) = [];
    oldgrid(:, 1.0) = [];
    % 148 150
    oldfields = get(oldgrid(~(isnan(oldgrid))), 'tag');
    % 150 152
    issamestructure = isequal(oldfields, lower(labels));
    % 152 154
    if ~(issamestructure)
        % 154 156
        remove(hLayout, 1.0, 1.0);
        remove(hLayout, 1.0, 2.0);
        % 157 159
        tag = lower(labels{1.0});
        hLayout.add(h.(horzcat(tag, '_lbl')), 1.0, 1.0, 'TopInset', mtimes(15.0, sz.pixf), 'Fill', 'Horizontal', 'MinimumWidth', largestuiwidth(h.(horzcat(tag, '_lbl'))), 'Anchor', 'South');
        % 160 165
        % 161 165
        % 162 165
        % 163 165
        hLayout.add(h.(tag), 1.0, 2.0, 'TopInset', mtimes(15.0, sz.pixf), 'Anchor', 'South', 'Fill', 'Horizontal');
        % 165 170
        % 166 170
        % 167 170
        % 168 170
        set(h.(lower(labels{1.0})), 'String', fi.(labels{1.0}));
        set(horzcat(h.(horzcat(tag, '_lbl')), h.(tag)), 'Visible', 'On');
        % 171 173
        nlabels = length(labels);
        for indx=2.0:nlabels
            tag = lower(labels{indx});
            % 175 178
            % 176 178
            if ~(isfield(h, tag))
                h.(horzcat(tag, '_lbl')) = uicontrol(hp, 'Style', 'Text', 'HorizontalAlignment', 'Left', 'tag', tag, 'Visible', 'Off', 'ForegroundColor', [0.0 0.0 1.0], 'String', sprintf('%s:', interspace(labels{indx})));
                % 179 186
                % 180 186
                % 181 186
                % 182 186
                % 183 186
                % 184 186
                h.(tag) = uicontrol(hp, 'Style', 'Text', 'HorizontalAlignment', 'Left', 'Tag', tag, 'Visible', 'Off');
                % 186 191
                % 187 191
                % 188 191
                % 189 191
            end
            % 191 194
            % 192 194
            hLayout.remove(indx, 1.0);
            hLayout.remove(indx, 2.0);
            % 195 198
            % 196 198
            hLayout.add(h.(horzcat(tag, '_lbl')), indx, 1.0, 'Fill', 'Horizontal', 'MinimumHeight', ht, 'MinimumWidth', largestuiwidth(h.(horzcat(tag, '_lbl'))));
            % 198 203
            % 199 203
            % 200 203
            % 201 203
            hLayout.add(h.(tag), indx, 2.0, 'MinimumHeight', ht, 'Fill', 'Horizontal');
            % 203 207
            % 204 207
            % 205 207
            set(horzcat(h.(tag), h.(horzcat(tag, '_lbl'))), 'Visible', 'On');
            % 207 210
            % 208 210
            set(h.(tag), 'String', fi.(labels{indx}));
        end % for
        % 211 214
        % 212 214
        for indx=plus(nlabels, 1.0):7.0
            remove(hLayout, indx, 1.0);
            remove(hLayout, indx, 2.0);
        end % for
    else
        for indx=1.0:length(labels)
            tag = lower(labels{indx});
            set(h.(tag), 'String', fi.(labels{indx}));
        end % for
    end
    % 223 226
    % 224 226
    hOld = setdiff(convert2vector(h), hLayout.Grid(ishandle(hLayout.Grid)));
    set(hOld, 'Visible', 'Off');
    % 227 229
    set(this, 'Handles', h);
    ht = max(ht, getbestsize(h.(lower(labels{1.0})), 'height'));
    % 230 232
    hLayout.setconstraints(1.0, 1.0, 'MinimumHeight', ht);
    hLayout.setconstraints(1.0, 2.0, 'MinimumHeight', ht);
end
function source_listener(this, eventData)
    % 235 238
    % 236 238
    set(this.Handles.source, 'String', get(this, 'Source'));
end
