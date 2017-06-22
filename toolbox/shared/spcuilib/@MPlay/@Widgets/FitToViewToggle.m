function FitToViewToggle(widgetsObj, newState)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(nargin, 2.0)
        % 9 10
        newState = not(widgetsObj.FitToViewState);
    end % if
    widgetsObj.FitToViewState = newState;
    % 13 15
    % 14 15
    widgetsObj.FitToView;
end % function
