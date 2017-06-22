function listeners(this, eventData, fcn, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    feval(fcn, this, eventData, varargin{:});
function cshtags_listener(this, eventData)
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    update(this, 'update_cshtags');
function disabledselections_listener(this, eventData)
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    update(this, 'update_enablestates');
function identifiers_listener(this, eventData)
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    tags = get(this, 'Identifiers');
    h = get(this, 'Handles');
    % 29 32
    % 30 32
    for i=1.0:length(tags)
        % 32 34
        if iscell(tags{i})
            set(h.radio(i), 'Tag', tags{i}{1.0});
            % 35 38
            % 36 38
            set(h.popup(i), 'Tag', tags{i}{1.0}, 'UserData', cellhorzcat(tags{i}{2.0:end}));
        else
            set(h.radio(i), 'Tag', tags{i});
        end % if
    end % for
    % 42 45
    % 43 45
    subs = getsubselections(this);
    if not(any(strcmpi(this.SubSelection, subs)))
        if isempty(subs)
            set(this, 'privSubSelection', '');
        else
            set(this, 'privSubSelection', subs{1.0});
        end % if
    end % if
function selection_listener(this, eventData)
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    update(this, 'update_radiobtns');
function subselection_listener(this, eventData)
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    update(this, 'update_popup');
function strings_listener(this, eventData)
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    strs = get(this, 'Strings');
    tags = get(this, 'Identifiers');
    h = get(this, 'Handles');
    % 75 78
    % 76 78
    for i=1.0:length(strs)
        if iscell(strs{i})
            if difference(this, i)
                set(h.radio(i), 'String', '');
                popstr = strs{i};
            else
                set(h.radio(i), 'String', strs{i}{1.0});
                popstr = strs{i}(2.0:end);
            end % if
            visState = this.Visible;
        else
            set(h.radio(i), 'String', strs{i});
            visState = 'Off';
            popstr = {''};
        end % if
        % 92 95
        % 93 95
        if gt(get(h.popup(i), 'Value'), length(popstr))
            set(h.popup(i), 'Value', 1.0);
        end % if
        % 97 99
        set(h.popup(i), 'String', popstr, 'Visible', visState);
    end % for
    % 100 102
    resize_all_popup(this);
    update(this, 'update_popup');
function resize_all_popup(this)
    % 104 114
    % 105 114
    % 106 114
    % 107 114
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    h = get(this, 'Handles');
    % 114 117
    % 115 117
    if isempty(h.frame)
        return;
    end % if
    sz = gui_sizes(this);
    % 120 122
    strings = getstrings(h.popup);
    newwidth = plus(largestuiwidth(strings), sz.rbwTweak);
    % 123 125
    origUnits = get(h.frame(1.0), 'Units');
    set(h.frame(1.0), 'Units', 'Pixels');
    framePos = get(h.frame(1.0), 'Position');
    set(h.frame(1.0), 'Units', origUnits);
    origUnits = get(h.popup(1.0), 'Units');
    set(h.popup(1.0), 'Units', 'Pixels');
    popPos = get(h.popup(1.0), 'Position');
    set(h.popup(1.0), 'Units', origUnits);
    if gt(plus(popPos(1.0), newwidth), minus(plus(framePos(1.0), framePos(3.0)), sz.hfus))
        newwidth = minus(minus(plus(framePos(3.0), framePos(1.0)), popPos(1.0)), sz.hfus);
    end % if
    if gt(newwidth, popPos(3.0))
        h = get(this, 'Handles');
        % 137 140
        % 138 140
        for indx=1.0:length(h.popup)
            origUnits = get(h.popup(indx), 'Units');
            set(h.popup(indx), 'Units', 'Pixels');
            pos = get(h.popup(indx), 'Position');
            pos(3.0) = newwidth;
            set(h.popup(indx), 'Position', pos, 'Units', origUnits);
        end % for
    end % if
function strs = getstrings(hpop)
    % 148 151
    % 149 151
    strs = get(hpop, 'String');
    % 151 153
    if not(iscell(strs))
        strs = cellhorzcat(strs);
    end % if
    if not(iscellstr(strs))
        for i=1.0:length(strs)
            strs{i} = ctranspose(strs{i});
        end % for
        strs = horzcat(strs{:});
        strs = strs(:);
    end % if
