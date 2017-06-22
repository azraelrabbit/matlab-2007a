function fig = getfigure(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    fig = -1.0;
    % 9 11
    % 10 11
    if eq(h.CompositePlot, false)
        if isempty(get(h, 'FigureTag'))
            fig = figure('Color', [.8 .8 .8]);
        else
            fig = findobj('Type', 'Figure', 'Tag', get(h, 'FigureTag'));
            if isempty(fig)
                fig = figure('Color', [.8 .8 .8]);
            end % if
            fig = fig(1.0);
            figure(fig);
            clf;
        end % if
    end % if
end % function
