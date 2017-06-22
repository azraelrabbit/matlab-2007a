function varargout = convert(hFDA)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hC = getcomponent(hFDA, '-class', 'siggui.convert');
    % 8 10
    if isempty(hC)
        % 10 12
        filtobj = getfilter(hFDA);
        % 12 15
        % 13 15
        hC = siggui.convert(filtobj, getflags(hFDA, 'calledby', 'dspblks'));
        addcomponent(hFDA, hC);
        % 16 19
        % 17 19
        render(hC);
        centerdlgonfig(hC, hFDA);
        set(hC, 'Visible', 'On');
        % 21 24
        % 22 24
        addlistener(hFDA, 'FilterUpdated', @local_filter_listener, hC);
        l = handle.listener(hC, 'FilterConverted', cellhorzcat(@filterconverted_eventcb, hFDA));
        setappdata(hC.FigureHandle, 'FDATool_convert_listener', l);
    else
        % 27 29
        set(hC, 'Visible', 'On');
        figure(hC.FigureHandle);
    end % if
    % 31 33
    if nargout
        varargout = cellhorzcat(hC);
    end % if
end % function
function filterconverted_eventcb(hObj, eventData, hFDA)
    data = get(eventData, 'data');
    % 38 40
    opts.mcode = data.mcode;
    opts.source = sprintf('%s (converted)', strrep(hFDA.filtermadeby, ' (converted)', ''));
    opts.source = strrep(opts.source, ' (quantized)', '');
    % 42 44
    hFDA.setfilter(data.filter, opts);
end % function
function local_filter_listener(hC, eventData)
    % 46 50
    % 47 50
    % 48 50
    hFDA = get(eventData, 'Source');
    % 50 53
    % 51 53
    newfilt = getfilter(hFDA);
    % 53 55
    hC.Filter = newfilt;
end % function
