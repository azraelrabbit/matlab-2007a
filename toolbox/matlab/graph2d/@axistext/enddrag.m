function aObj = enddrag(aObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    savedState = get(aObj, 'SavedState');
    if not(savedState.DataUnitDrag)
        aObj = set(aObj, 'Units', savedState.OldUnits);
    end % if
    % 12 13
    axischildObj = aObj.axischild;
    aObj.axischild = enddrag(axischildObj);
end % function
