function sosview(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hdlg = getcomponent(this, '-class', 'siggui.sosviewdlg');
    % 8 11
    % 9 11
    if isempty(hdlg)
        hdlg = siggui.sosviewdlg;
        addcomponent(this, hdlg);
        % 13 16
        % 14 16
        opts_listener(this);
        % 16 19
        % 17 19
        l = vertcat(handle.listener(hdlg, 'DialogApplied', @lcldialogapplied_listener), handle.listener(this, this.findprop('sosviewopts'), 'PropertyPostSet', @opts_listener));
        % 19 24
        % 20 24
        % 21 24
        % 22 24
        set(l, 'CallbackTarget', this);
        set(this, 'SosViewListeners', l);
    end
    % 26 29
    % 27 29
    if ~(isrendered(hdlg))
        render(hdlg);
        centerdlgonfig(hdlg, this);
    end
    % 32 34
    set(hdlg, 'Visible', 'on');
    figure(hdlg.FigureHandle);
end
function opts_listener(this, eventData)
    % 37 40
    % 38 40
    hdlg = getcomponent(this, '-class', 'siggui.sosviewdlg');
    opts = get(this, 'sosViewOpts');
    if ~(isempty(opts))
        setopts(hdlg, opts);
    end
end
function lcldialogapplied_listener(this, eventData)
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    Hd = get(this, 'Filters');
    % 51 54
    % 52 54
    if ne(length(Hd), 1.0)
        warnstate = true;
    else
        if ~(isa(Hd.Filter, 'dfilt.abstractsos'))
            warnstate = true;
        else
            warnstate = false;
        end
    end
    if warnstate
        h = siggui.dontshowagaindlg;
        set(h, 'Name', 'SOS View', 'Text', {'The SOS View settings only apply when you have a single second-order section filter.  Your settings have been saved for later use.'}, 'PrefTag', 'sosviewwarning');
        % 65 72
        % 66 72
        % 67 72
        % 68 72
        % 69 72
        % 70 72
        if h.need2show
            % 72 74
            render(h);
            set(h, 'Visible', 'on');
            % 75 79
            % 76 79
            % 77 79
            l = handle.listener(handle(this.FigureHandle), 'ObjectBeingDestroyed', @(hh,eventStruct)delete(h));
            % 79 81
            setappdata(h.FigureHandle, 'parent_listener', l);
        end
    end
    % 83 85
    set(this, 'SosViewOpts', copy(getopts(eventData.Source, this.sosViewOpts)));
end
