function currState = loop_saveState(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    currState.CurrentFigure = get(0.0, 'CurrentFigure');
    currState.CurrentAxes = get(currState.CurrentFigure, 'CurrentAxes');
end % function
