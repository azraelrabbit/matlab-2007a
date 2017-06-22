function retList = getMemSecPackageList(hObj, currPackage, refresh)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    mlock;
    persistent packageList;
    % 8 10
    defaultPackageList = {'--- None ---';'Simulink';'mpt'};
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    if isempty(packageList)
        packageList = defaultPackageList;
    end
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    if refresh
        % 22 26
        % 23 26
        % 24 26
        hw = waitbar(0.0, 'Finding packages', 'Name', 'Please wait...');
        packageList = defaultPackageList;
        fullPackageList = slprivate('find_valid_packages');
        for i=1.0:length(fullPackageList)
            thisName = fullPackageList{i};
            if not(any(strcmp(thisName, defaultPackageList))) && not(isempty(processcsc('GetCSCRegFile', thisName))) && not(isempty(processcsc('GetMemorySectionDefns', thisName, true)))
                % 31 34
                % 32 34
                packageList{plus(end, 1.0)} = thisName;
            end
            waitbar(mrdivide(i, length(fullPackageList)), hw);
        end % for
        close(hw);
    end
    % 39 42
    % 40 42
    if not(any(strcmp(packageList, currPackage)))
        packageList = vertcat(packageList, cellhorzcat(currPackage));
    end
    % 44 48
    % 45 48
    % 46 48
    retList = packageList;
    % 48 50
end
