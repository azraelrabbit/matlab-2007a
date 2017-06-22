function OnDownButton(hThis, hSource, widgetVal, widgetTag)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    tagStr = horzcat(hThis.ObjId, '.', hThis.ValueBlkParam, '.Edit');
    % 6 7
    tmpVal = minus(hThis.Value, 1.0);
    if gt(tmpVal, minus(hThis.MinValue, 1.0))
        hThis.Value = tmpVal;
        hSource.setWidgetValue(tagStr, num2str(hThis.Value))
    end % if
    % 12 15
    % 13 15
    % 14 15
    hThis.notifyListeners(hSource, widgetVal, widgetTag);
end % function
