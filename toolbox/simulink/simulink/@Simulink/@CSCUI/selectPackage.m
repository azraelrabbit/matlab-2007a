function selectPackage(hUI, packageNameOrIdx)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    if isempty(packageNameOrIdx)
        return;
    end % if
    % 8 10
    if not(hUI.TESTING_DONT_ASK_DONT_SAVE)
        if not(hUI.promptSave('SelectPackage'))
            return;
        end % if
    end % if
    % 14 16
    switch class(packageNameOrIdx)
    case 'char'
        packageName = packageNameOrIdx;
    case 'double'
        packageName = hUI.PackageNames{plus(packageNameOrIdx, 1.0)};
    end % switch
    % 21 23
    if ismember(packageName, hUI.PackageNames)
        hUI.CurrPackage = packageName;
    else
        % 25 27
        if not(strcmp(packageName, 'Simulink'))
            tmpstr = horzcat('@', packageName, filesep, 'schema');
            if isempty(which(tmpstr))
                errmsg = sprintf('Package %s not found on your MATLAB path.', packageName);
                errordlg(errmsg, 'Custom Storage Class Designer', 'non-modal');
                return;
            end % if
        end % if
        % 34 36
        hUI.PackageNames = union(hUI.PackageNames, packageName);
        hUI.CurrPackage = packageName;
    end % if
    % 38 41
    % 39 41
    loadCurrPackage(hUI);
end % function
