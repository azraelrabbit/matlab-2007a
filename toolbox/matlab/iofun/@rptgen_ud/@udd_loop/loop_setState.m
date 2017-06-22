function ok = loop_setState(h, currObj, objName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    objType = h.loop_getObjectType(currObj);
    adUD = rptgen_ud.appdata_ud;
    set(adUD, horzcat('Current', objType), currObj, 'Context', objType);
    % 10 14
    % 11 14
    % 12 14
    if strcmpi(objType, 'package')
        % 14 17
        % 15 17
        adUD.ClassInheritanceTable = adUD.buildClassInheritance(currObj);
        % 17 20
        % 18 20
    end
    % 20 22
    ok = logical(1);
end
