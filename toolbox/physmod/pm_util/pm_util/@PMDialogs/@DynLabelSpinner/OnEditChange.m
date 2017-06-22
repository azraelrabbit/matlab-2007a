function OnEditChange(hThis, hDlgSrc, widgetVal, widgetTag)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    errFound = false;
    % 11 12
    tmpNumVal = str2double(widgetVal);
    if isnan(tmpNumVal)
        beep;
        msgbox(xlate('Input value must be an integer.'), xlate('Invalid Input Type'), 'error');
        % 16 17
        errFound = true;
    end % if
    % 19 20
    tmpNumVal = int8(tmpNumVal);
    % 21 22
    if not(errFound) && not(isinteger(tmpNumVal))
        beep;
        msgbox(xlate('Input value must be an integer.'), xlate('Invalid Input Type'), 'error');
        % 25 26
        errFound = true;
    end % if
    % 28 29
    if not(errFound) && lt(tmpNumVal, 0.0)
        beep;
        msgbox(xlate('Input value must be an integer.'), xlate('Invalid Input Type'), 'error')
        % 32 33
        errFound = true;
    end % if
    % 35 36
    if errFound
        % 37 38
        hDlgSrc.setWidgetValue(widgetTag, hThis.ValueTxt);
    else
        hThis.Value = tmpNumVal;
    end % if
    % 42 43
    hThis.ValueTxt = num2str(hThis.Value);
    % 44 46
    % 45 46
    hThis.notifyListeners(hDlgSrc, widgetVal, widgetTag);
    % 47 48
end % function
