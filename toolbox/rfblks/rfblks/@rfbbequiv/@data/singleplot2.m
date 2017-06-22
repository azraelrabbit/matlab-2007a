function fig = singleplot2(h, plottype, parameters, freq, pin, conditions, plotfun)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 4.0)
        freq = {};
    end % if
    if lt(nargin, 5.0)
        pin = {};
    end % if
    if lt(nargin, 6.0)
        conditions = {};
    end % if
    if lt(nargin, 7.0)
        plotfun = 'plot';
    end % if
    if eq(numel(freq), 1.0)
        freq = cellhorzcat('freq', freq{:});
    end % if
    if eq(numel(pin), 1.0)
        pin = cellhorzcat('pin', pin{:});
    end % if
    set(h, 'CompositePlot', false, 'NeedReset', false);
    % 25 28
    % 26 28
    switch plottype
    case 'X-Y plane'
        plot(h, parameters{:}, freq{:}, pin{:}, conditions{:}, plotfun);
    case 'Plotyy'
        plotyy(h, parameters{:}, freq{:}, pin{:}, conditions{:}, plotfun);
    case 'Link budget'
        plot(h, 'budget', parameters{:}, freq{:}, pin{:}, conditions{:});
    case 'Polar plane'
        polar(h, parameters{horzcat(1.0:2.0:minus(end, 2.0), minus(end, 1.0), end)}, freq{:}, pin{:}, conditions{:});
    case 'Z Smith chart'
        smith(h, parameters{horzcat(1.0:2.0:minus(end, 2.0), minus(end, 1.0), end)}, freq{:}, pin{:}, conditions{:}, 'z');
    case 'Y Smith chart'
        smith(h, parameters{horzcat(1.0:2.0:minus(end, 2.0), minus(end, 1.0), end)}, freq{:}, pin{:}, conditions{:}, 'y');
    case 'ZY Smith chart'
        smith(h, parameters{horzcat(1.0:2.0:minus(end, 2.0), minus(end, 1.0), end)}, freq{:}, pin{:}, conditions{:}, 'zy');
    end % switch
    fig = gcf;
    if any(strcmpi(parameters, 'S11')) || any(strcmpi(parameters, 'S12')) || any(strcmpi(parameters, 'S21')) || any(strcmpi(parameters, 'S22')) || any(strcmpi(parameters, 'LS11')) || any(strcmpi(parameters, 'LS12')) || any(strcmpi(parameters, 'LS21')) || any(strcmpi(parameters, 'LS22')) || any(strcmpi(parameters, 'VSWRIN')) || any(strcmpi(parameters, 'VSWROUT'))
        % 45 50
        % 46 50
        % 47 50
        % 48 50
        ht = title(horzcat('Z0 = ', num2str(h.Z0)));
        if strfind(plottype, 'Smith chart')
            posvec = get(ht, 'Position');
            posvec(1.0) = -1.0;
            set(ht, 'Position', posvec);
        end % if
    end % if
    % 56 58
    name = get(fig, 'Name');
    if isempty(name) || not(ishold)
        name = h.Block;
    end % if
    if not(isempty(name))
        set(fig, 'Name', name);
    else
        set(fig, 'Name', gcb);
    end % if
    set(fig, 'NumberTitle', 'off')
    set(h, 'NeedReset', true);
end % function
