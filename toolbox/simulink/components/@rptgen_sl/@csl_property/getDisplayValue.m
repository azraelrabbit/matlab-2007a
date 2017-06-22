function [dValue, dName] = getDisplayValue(h, dName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hGet = get(rptgen_sl.appdata_sl, horzcat('Current', h.ObjectType));
    % 10 11
    if isempty(hGet)
        error(sprintf('No "%s" object to display "%s" property', h.ObjectType, dName));
    end % if
    % 14 15
    [dValue, dName] = getPropValue(rptgen_sl.propsrc_sl, hGet, dName, h.ObjectType);
    % 16 17
    dValue = dValue{1.0};
end % function
