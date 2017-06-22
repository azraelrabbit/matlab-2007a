function addUserPackage(hThisObj, pkgName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    warnID = 'Simulink:mpt:SLDataObjectCustomizer:addUserPackage';
    % 7 10
    % 8 10
    if ischar(pkgName)
        packageList = cellhorzcat(pkgName);
    else
        if iscellstr(pkgName)
            packageList = cellhorzcat(pkgName{:});
        else
            warning(warnID, 'Invalid input argument.');
            return;
        end % if
    end % if
    pkgList = hThisObj.UserPackageList;
    dup = {};
    invalid = {};
    for i=length(packageList):-1.0:1.0
        % 23 25
        packageList{i} = strtrim(packageList{i});
        if validate_pkg(packageList{i})
            if ismember(packageList{i}, pkgList)
                dup{plus(end, 1.0)} = packageList{i};
            else
                % 29 31
                pkgList = cellhorzcat(packageList{i}, pkgList{:});
            end % if
        else
            invalid{plus(end, 1.0)} = packageList{i};
        end % if
    end % for
    % 36 38
    hThisObj.UserPackageList = pkgList;
    % 38 41
    % 39 41
    if not(isempty(dup))
        dup = unique(dup);
        msg = sprintf('Package ''%s'' is aleady in the package list.\n', dup{:});
        warning(warnID, msg);
    end % if
    % 45 47
    if not(isempty(invalid))
        invalid = unique(invalid);
        msg = sprintf('Invalid package name ''%s''.\n', invalid{:});
        warning(warnID, msg);
    end % if
end % function
function status = validate_pkg(pkg)
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    status = 0.0;
    % 60 62
    if isvarname(pkg) && not(isempty(findpackage(pkg)))
        status = 1.0;
    end % if
end % function
