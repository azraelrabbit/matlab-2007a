function hObj = invoke(hThis, fullClassNameStr, hBlk)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    hObj = 0.0;
    % 6 8
    % 7 8
    fullClsName = fullClassNameStr;
    [pkgName, restOfStr] = strtok(fullClsName, '.');
    clsName = strtok(restOfStr, '.');
    % 11 13
    % 12 13
    if eq(strncmp('Pm', clsName, 2.0), true)
        clsName = clsName(3.0:length(clsName));
    end % if
    % 16 17
    clsPrefix = 'Dyn';
    derivedClsName = horzcat(clsPrefix, clsName);
    % 19 21
    % 20 21
    hPkg = findpackage(pkgName);
    if isempty(hPkg)
        error(horzcat(xlate('createInstance: unrecognized package name'), ' ''', pkgName, ''''));
    end % if
    hClassObj = hPkg.findclass(derivedClsName);
    if isempty(hClassObj)
        error(horzcat(xlate('createInstance: unrecognized class name'), ' ''', derivedClsName, ''''));
    end % if
    % 29 30
    fullClsNameStr = horzcat(pkgName, '.', clsPrefix, clsName);
    hObj = feval(fullClsNameStr, hBlk);
end % function
