function fig = singleplot(h, disptype, parameters, numparams, format)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isempty(get(h, 'S_Parameters')) && not(hasnoisereference(h)) && not(haspowerreference(h))
        % 8 10
        id = 'rfblks:rfbbequiv:data:singleplot:EmptyData';
        if isempty(h.Block)
            error(id, '%s: does not have any data to plot.', h.Name);
        else
            error(id, 'This block does not have any data to plot.');
        end % if
    end % if
    set(h, 'CompositePlot', false, 'NeedReset', false);
    % 17 20
    % 18 20
    switch disptype
    case 'X-Y plane'
        plot(h, parameters{1.0:numparams}, format);
    case 'Link budget'
        plot(h, 'budget', parameters{1.0:numparams}, format);
    case 'Polar plane'
        polar(h, parameters{1.0:numparams});
    case 'Z Smith chart'
        smith(h, parameters{1.0:numparams}, 'z');
    case 'Y Smith chart'
        smith(h, parameters{1.0:numparams}, 'y');
    case 'ZY Smith chart'
        smith(h, parameters{1.0:numparams}, 'zy');
    end % switch
    fig = gcf;
    if any(strcmpi(parameters, 'S11')) || any(strcmpi(parameters, 'S12')) || any(strcmpi(parameters, 'S21')) || any(strcmpi(parameters, 'S22')) || any(strcmpi(parameters, 'VSWRIN')) || any(strcmpi(parameters, 'VSWROUT'))
        % 35 38
        % 36 38
        ht = title(horzcat('Z0 = ', num2str(h.Z0)));
        if strfind(disptype, 'Smith chart')
            posvec = get(ht, 'Position');
            posvec(1.0) = -1.0;
            set(ht, 'Position', posvec);
        end % if
    end % if
    % 44 46
    name = get(fig, 'Name');
    if isempty(name) || not(ishold)
        name = h.Block;
    end % if
    if not(isempty(name))
        set(fig, 'Name', name);
    end % if
    set(h, 'NeedReset', true);
    legend('show');
end % function
