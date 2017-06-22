function setAxisCB(hThis, hSrc, widgetVal)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if ne(numel(widgetVal), 1.0) || not(isstring(widgetVal{1.0}))
        error('MechPrimitiveHelper::setAxisCB', 'Invalid widget value.')
    end % if
    disp('setAxisCB');
    hSrc.setAxisCB = widgetVal{1.0};
end % function
