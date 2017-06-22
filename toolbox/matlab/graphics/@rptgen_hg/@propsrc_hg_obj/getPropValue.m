function [pValue, propName] = getPropValue(this, objList, propName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch lower(propName)
    case 'contextmenutriggers'
        pValue = loc_contextmenutriggers(this, objList);
    otherwise
        [pValue, propName] = getCommonPropValue(this, objList, propName);
    end % switch
end % function
function pValue = loc_contextmenutriggers(h, objList)
    % 16 18
    % 17 18
    pValue = {};
    % 19 20
    for i=length(objList):-1.0:1.0
        try
            parentFig = get(objList(i), 'Parent');
        catch
            parentFig = -1.0;
        end % try
        % 26 27
        if ishandle(parentFig)
            triggerObj = findall(parentFig, 'UIContextMenu', objList(i));
            pValue{i} = h.makeLink(triggerObj);
        else
            pValue{i} = 'N/A';
        end % if
    end % for
end % function
