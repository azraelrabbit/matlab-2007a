function fig = compositeplot(h, defaulttag)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isempty(get(h, 'S_Parameters')) && not(hasnoisereference(h)) && not(haspowerreference(h))
        % 8 10
        id = 'rfblks:rfbbequiv:data:compositeplot:EmptyData';
        if isempty(h.Block)
            error(id, '%s: does not have any data to plot.', h.Name);
        else
            error(id, 'This block does not have any data to plot.');
        end % if
    end % if
    % 16 19
    % 17 19
    set(h, 'CompositePlot', true, 'NeedReset', false);
    % 19 22
    % 20 22
    if isempty(defaulttag)
        fig = figure('NumberTitle', 'off', 'Name', h.Block);
    else
        fig = findobj('Tag', defaulttag);
        if isempty(fig)
            fig = figure('NumberTitle', 'off', 'Name', h.Block);
        end % if
        fig = fig(1.0);
        figure(fig);
        clf;
    end % if
    info = datainfo(h);
    % 33 35
    switch info
    case 'All Data'
        subplot(2.0, 2.0, 1.0);
        plot(h, 'S12', 'S21', 'db');
        legend('hide')
        subplot(2.0, 2.0, 2.0);
        polar(h, 'S11', 'S22');
        legend('hide')
        subplot(2.0, 2.0, 3.0);
        plot(h, 'Pout', 'dBm');
        legend('hide')
        subplot(2.0, 2.0, 4.0);
        smith(h, 'S11', 'S22', 'z');
        legend('hide')
    case 'Power Data with Network Parameters'
        subplot(2.0, 2.0, 1.0);
        plot(h, 'S12', 'S21', 'db');
        legend('hide')
        subplot(2.0, 2.0, 2.0);
        polar(h, 'S11', 'S22');
        legend('hide')
        subplot(2.0, 2.0, 3.0);
        plot(h, 'Pout', 'dBm');
        legend('hide')
        subplot(2.0, 2.0, 4.0);
        smith(h, 'S11', 'S22', 'z');
        legend('hide')
    case 'Power Data with Noise Data'
        subplot(2.0, 1.0, 1.0);
        plot(h, 'Pout', 'dBm');
        legend('hide')
        subplot(2.0, 1.0, 2.0);
        plot(h, 'Phase', 'angle');
        legend('hide')
    case 'Network Parameters With Noise Data'
        subplot(2.0, 2.0, 1.0);
        plot(h, 'S12', 'S21', 'db');
        legend('hide')
        subplot(2.0, 2.0, 2.0);
        polar(h, 'S11', 'S22');
        legend('hide')
        subplot(2.0, 2.0, 3.0);
        plot(h, 'S12', 'S21', 'angle');
        legend('hide')
        subplot(2.0, 2.0, 4.0);
        smith(h, 'S11', 'S22', 'z');
        legend('hide')
    case 'Power Data Only'
        subplot(2.0, 1.0, 1.0);
        plot(h, 'Pout', 'dBm');
        legend('hide')
        subplot(2.0, 1.0, 2.0);
        plot(h, 'Phase', 'angle');
        legend('hide')
    case 'Network Parameters Only'
        subplot(2.0, 2.0, 1.0);
        plot(h, 'S12', 'S21', 'db');
        legend('hide')
        subplot(2.0, 2.0, 2.0);
        polar(h, 'S11', 'S22');
        legend('hide')
        subplot(2.0, 2.0, 3.0);
        plot(h, 'S12', 'S21', 'angle');
        legend('hide')
        subplot(2.0, 2.0, 4.0);
        smith(h, 'S11', 'S22', 'z');
        legend('hide')
    case 'Noise Data Only'
        subplot(2.0, 1.0, 1.0);
        plot(h, 'FMIN', 'dB');
        legend('hide')
        subplot(2.0, 1.0, 2.0);
        plot(h, 'GAMMAOPT', 'angle');
        legend('hide')
    end % switch
    name = get(fig, 'Name');
    if isempty(name) || not(ishold)
        name = h.Block;
    end % if
    if not(isempty(name))
        set(fig, 'Name', name);
    else
        set(fig, 'Name', gcb);
    end % if
    set(h, 'CompositePlot', false, 'NeedReset', true);
end % function
