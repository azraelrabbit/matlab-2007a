function varargout = sos(hFDA)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if qfiltexists
        c = 'siggui.sosreorderdlg';
    else
        c = 'siggui.sos';
    end % if
    % 12 14
    hSOS = getcomponent(hFDA, '-class', c);
    % 14 16
    if isempty(hSOS)
        % 16 18
        filtobj = getfilter(hFDA);
        % 18 20
        hSOS = feval(c, filtobj);
        addcomponent(hFDA, hSOS);
        % 21 24
        % 22 24
        s = get(hFDA, 'LastLoadState');
        if isfield(s, 'sosreorderdlg')
            setstate(hSOS, s.sosreorderdlg);
        end % if
        % 27 30
        % 28 30
        render(hSOS);
        centerdlgonfig(hSOS, hFDA);
        set(hSOS, 'Visible', 'On');
        % 32 35
        % 33 35
        addlistener(hFDA, 'FilterUpdated', @sos_filter_listener, hSOS);
        l = handle.listener(hSOS, 'NewFilter', cellhorzcat(@filterconverted_eventcb, hFDA));
        setappdata(hSOS.FigureHandle, 'FDATool_sos_listener', l);
    else
        % 38 40
        set(hSOS, 'Visible', 'On');
        figure(hSOS.FigureHandle);
    end % if
    % 42 44
    if nargout
        varargout = cellhorzcat(hSOS);
    end % if
end % function
function filterconverted_eventcb(hObj, eventData, hFDA)
    % 48 51
    % 49 51
    data = get(eventData, 'data');
    % 51 54
    % 52 54
    if isempty(hFDA.Mcode)
        opts.mcode = [];
    else
        opts.mcode = data.mcode;
    end % if
    % 58 60
    hFDA.setfilter(data.filter, opts);
end % function
function sos_filter_listener(hSOS, eventData)
    % 62 66
    % 63 66
    % 64 66
    hFDA = get(eventData, 'Source');
    % 66 68
    Hd = getfilter(hFDA);
    if isa(Hd, 'dfilt.abstractsos')
        hSOS.Filter = getfilter(hFDA);
        enab = hFDA.Enable;
    else
        enab = 'Off';
    end % if
    set(hSOS, 'ENable', enab);
end % function
