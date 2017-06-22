function setRefFrameCB(hThis, hSrc, widgetVal)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if ne(numel(widgetVal), 1.0)
        error('MechPrimitiveHelper::setRefFrameCB', 'Invalid widget value.')
    end % if
    disp('setRefFrameCB');
    % 9 10
    hSrc.RefFrame = widgetVal{1.0};
end % function
