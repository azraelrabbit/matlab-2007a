function setUserPackages(hThisObj, pkgNameList)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hThisObj.UserPackageList = {};
    % 10 12
    % 11 12
    if not(isempty(pkgNameList))
        % 13 14
        hThisObj.addUserPackage(pkgNameList);
    end % if
end % function
