function varargout = reordersos(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    Hd = getfilter(this);
    % 8 10
    if isa(Hd, 'dfilt.abstractsos')
        hdlg = getcomponent(this, '-class', 'siggui.sosreorderdlg');
        if isempty(hdlg)
            % 12 15
            % 13 15
            hdlg = siggui.sosreorderdlg(Hd);
            % 15 18
            % 16 18
            addcomponent(this, hdlg);
            % 18 22
            % 19 22
            % 20 22
            addlistener(this, 'FilterUpdated', cellhorzcat(@lclfilterupdated_listener, hdlg));
            l = handle.listener(hdlg, 'FilterReordered', cellhorzcat(@lclfilterreordered_listener, hdlg));
            set(l, 'CallbackTarget', this);
            setappdata(this, 'sosreorderlistener', l);
        end % if
    else
        error(generatemsgid('notSOS'), 'Only SOS filters can be reordered.');
    end % if
    % 29 32
    % 30 32
    if not(isrendered(hdlg))
        render(hdlg);
        centerdlgonfig(hdlg, this);
    end % if
    % 35 37
    set(hdlg, 'Visible', 'On');
    figure(hdlg.FigureHandle);
    % 38 40
    if nargout
        varargout = cellhorzcat(hdlg);
    end % if
end % function
function lclfilterupdated_listener(this, eventData, hdlg)
    % 44 47
    % 45 47
    Hd = getfilter(this);
    if isa(Hd, 'dfilt.abstractsos')
        enab = this.Enable;
        set(hdlg, 'Filter', Hd);
    else
        enab = 'Off';
    end % if
    % 53 55
    set(hdlg, 'Enable', enab);
end % function
function lclfilterreordered_listener(this, eventData, hdlg)
    % 57 60
    % 58 60
    opts.source = 'Reordered SOS';
    % 60 62
    setfilter(this, get(hdlg, 'Filter'), opts);
end % function
