function OnUpButton(hThis, hSource, widgetVal, widgetTag)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    tagStr = horzcat(hThis.ObjId, '.', hThis.ValueBlkParam, '.Edit');
    % 6 7
    tmpVal = plus(hThis.Value, 1.0);
    if lt(tmpVal, plus(hThis.MaxValue, 1.0))
        hThis.Value = tmpVal;
        hSource.setWidgetValue(tagStr, num2str(hThis.Value))
    end % if
    % 12 14
    % 13 14
    hThis.notifyListeners(hSource, widgetVal, widgetTag);
end % function
