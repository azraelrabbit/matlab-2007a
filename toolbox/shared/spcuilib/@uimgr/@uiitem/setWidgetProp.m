function setWidgetProp(theItem, propName, val)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    hWidget = theItem.hWidget;
    if ~(isempty(hWidget)) && ishandle(hWidget)
        hh = handle(hWidget);
        if ~(isempty(hh.findprop(propName)))
            if lt(nargin, 3.0)
                val = theItem.(propName);
            end
            set(hWidget, propName, val);
        end
    end
end
