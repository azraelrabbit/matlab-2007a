function super_render(this, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    pos = parseinputs(this, varargin{:});
    % 14 15
    framewlabel(this, pos);
    % 16 19
    % 17 19
    % 18 19
    fs_lv_h = allchild(this);
    % 20 23
    % 21 23
    % 22 23
    wrl = handle.listener(fs_lv_h, 'UserModifiedSpecs', @event_listener);
    % 24 26
    % 25 26
    set(wrl, 'callbacktarget', this);
    % 27 29
    % 28 29
    set(this, 'WhenRenderedlisteners', wrl);
end % function
function pos = parseinputs(this, varargin)
    % 32 34
    % 33 34
    sz = gui_sizes(this);
    % 35 36
    if gt(nargin, 1.0)
        if ischar(varargin{1.0})
            switch varargin{1.0}
            case 'freq'
                pos = mtimes([400.0 55.0 178.0 205.0], sz.pixf);
            case 'mag'
                pos = mtimes([583.0 55.0 178.0 205.0], sz.pixf);
            case 'freqmag'
                pos = mtimes([400.0 55.0 356.0 205.0], sz.pixf);
            end % switch
        else
            pos = varargin{1.0};
        end % if
    else
        pos = mtimes([10.0 10.0 178.0 205.0], sz.pixf);
    end % if
end % function
