function currState = loop_saveState(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    currState.CurrentFigure = get(0.0, 'CurrentFigure');
    currState.CurrentObject = get(currState.CurrentFigure, 'CurrentObject');
end % function
