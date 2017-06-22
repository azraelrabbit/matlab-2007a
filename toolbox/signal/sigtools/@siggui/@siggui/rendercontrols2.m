function rendercontrols2(this, row, col, varargin)
    % 1 34
    % 2 34
    % 3 34
    % 4 34
    % 5 34
    % 6 34
    % 7 34
    % 8 34
    % 9 34
    % 10 34
    % 11 34
    % 12 34
    % 13 34
    % 14 34
    % 15 34
    % 16 34
    % 17 34
    % 18 34
    % 19 34
    % 20 34
    % 21 34
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    error(nargchk(2.0, 5.0, nargin));
    % 34 36
    [props, tags, strs, styles] = parseinputs(this, varargin{:});
    % 36 38
    sz = gui_sizes(this);
    cbs = siggui_cbs(this);
    hPanel = get(this, 'Container');
    h = get(this, 'Handles');
    % 41 43
    hLayout = get(this, 'Layout');
    if isempty(hLayout)
        hLayout = siglayout.gridbaglayout(this.Container);
        set(this, 'Layout', hLayout);
    end
    % 47 49
    tooltips = gettooltips(this);
    [cshtags, cshtool] = getcshtags(this);
    % 50 53
    % 51 53
    for indx=1.0:length(tags)
        % 53 55
        switch styles{indx}
        case 'checkbox'
            width = 2.0;
            inputs = cellhorzcat('String', strs{indx});
        case {'edit','popup'}
            width = 1.0;
            inputs = {};
            if strcmpi(get(props(indx), 'DataType'), 'string vector')
                inputs = horzcat(inputs, {'Max',[2.0]});
            end
            if strcmpi(styles{indx}, 'popup')
                inputs = cellhorzcat(inputs{:}, 'String', set(this, tags{indx}));
            end
            if ~(isempty(strs{indx}))
                tag = horzcat(tags{indx}, '_lbl');
                if isfield(tooltips, tag)
                    lblinputs = cellhorzcat('Tooltip', tooltips.(tag));
                else
                    lblinputs = {};
                end
                % 74 76
                h.(tag) = uicontrol(hPanel, 'Style', 'Text', 'HorizontalAlignment', 'Left', 'Tag', tag, 'String', strs{indx}, lblinputs{:});
                % 76 82
                % 77 82
                % 78 82
                % 79 82
                % 80 82
                if isfield(cshtags, tags{indx})
                    cshelpcontextmenu(h.(tag), cshtags.(tags{indx}), cshtool);
                end
                % 84 86
                hLayout.add(h.(tag), minus(plus(row, indx), 1.0), col, 'Fill', 'Horizontal', 'Anchor', 'SouthWest', 'MinimumHeight', minus(sz.uh, sz.lblTweak));
                % 86 91
                % 87 91
                % 88 91
                % 89 91
            end
        end
        if isfield(tooltips, tags{indx})
            inputs = cellhorzcat(inputs{:}, 'Tooltip', tooltips.(tags{indx}));
        end
        h.(tags{indx}) = uicontrol(hPanel, 'Style', styles{indx}, 'HorizontalAlignment', 'Left', 'Tag', tags{indx}, inputs{:}, 'Callback', cellhorzcat(cbs.property, this, tags{indx}, sprintf('Change %s', strs{indx})));
        % 96 102
        % 97 102
        % 98 102
        % 99 102
        % 100 102
        if isfield(cshtags, tags{indx})
            cshelpcontextmenu(h.(tags{indx}), cshtags.(tags{indx}), cshtool);
        end
        % 104 106
        if eq(width, 2.0)
            colindx = col:plus(col, 1.0);
        else
            colindx = plus(col, 1.0);
        end
        % 110 112
        hLayout.add(h.(tags{indx}), minus(plus(row, indx), 1.0), colindx, 'Fill', 'Horizontal', 'MinimumHeight', sz.uh);
        % 112 115
        % 113 115
    end % for
    % 115 117
    set(this, 'Handles', h);
    % 117 120
    % 118 120
    h = handles2vector(this);
    h(~(isprop(h, 'enable'))) = [];
    setenableprop(h, this.Enable);
    % 122 125
    % 123 125
    l = handle.listener(this, props, 'PropertyPostSet', @prop_listener);
    set(l, 'CallbackTarget', this);
    set(this, 'WhenRenderedListeners', union(this.WhenRenderedListeners, l));
    % 127 129
    for indx=1.0:length(tags)
        try
            prop_listener(this, tags{indx});
            % 131 134
            % 132 134
        end % try
    end % for
end
function [props, tags, strs, styles] = parseinputs(this, tags, strs, styles)
    % 137 141
    % 138 141
    % 139 141
    if lt(nargin, 2.0)
        props = find(this.classhandle.Properties, 'AccessFlags.PublicSet', 'On', 'AccessFlags.PublicGet', 'On', '-not', 'Name', 'Tag');
        % 142 145
        % 143 145
        tags = get(props, 'Name');
    else
        % 146 148
        tags = cellstr(tags);
        for indx=1.0:length(tags)
            props(indx) = findprop(this, tags{indx});
        end % for
    end
    tags = lower(tags);
    % 153 156
    % 154 156
    if lt(nargin, 3.0)
        for indx=1.0:length(props)
            strs{indx} = get(props(indx), 'Description');
            % 158 162
            % 159 162
            % 160 162
            if isempty(strs{indx})
                strs{indx} = interspace(get(props(indx), 'Name'));
            end
        end % for
    else
        strs = cellstr(strs);
    end
    % 168 171
    % 169 171
    if lt(nargin, 4.0)
        for indx=1.0:length(tags)
            switch lower(get(props(indx), 'DataType'))
            case {'on/off','bool','strictbool','yes/no'}
                styles{indx} = 'checkbox';
            case {'string','string vector'}
                styles{indx} = 'edit';
            otherwise
                styles{indx} = 'popup';
            end
        end % for
    else
        styles = cellstr(styles);
    end
end
