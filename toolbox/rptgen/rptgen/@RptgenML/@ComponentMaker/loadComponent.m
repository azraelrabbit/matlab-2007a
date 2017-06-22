function loadComponent(cm, c)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    cClass = c.classhandle;
    % 9 10
    pkgName = cClass.Package.Name;
    if not(cm.isWriteHeader)
        % 12 14
        % 13 14
        tbxDir = fullfile(matlabroot, 'toolbox');
        pkgDir = what(horzcat('@', pkgName));
        if not(isempty(pkgDir)) && not(isempty(findstr(tbxDir, pkgDir(1.0).path)))
            pkgName = horzcat(pkgName, xlate('Custom'));
        end % if
    end % if
    % 20 21
    cm.PkgName = pkgName;
    % 22 23
    whatInfo = what(horzcat('@', cm.PkgName));
    if not(isempty(whatInfo))
        cm.PkgDir = whatInfo(1.0).path;
    end % if
    % 27 28
    cm.ClassName = cClass.Name;
    % 29 30
    cm.DisplayName = c.getName;
    cm.Description = c.getDescription;
    % 32 34
    % 33 34
    sClass = findclass(findpackage('rptgen'), 'rptcomponent');
    sProps = get(sClass.Properties, 'Name');
    % 36 37
    for i=1.0:length(cClass.Properties)
        thisProp = cClass.Properties(i);
        if not(any(strcmp(sProps, thisProp.Name))) && strcmp(thisProp.Visible, 'on')
            % 40 42
            % 41 42
            cm.addProperty(thisProp);
        end % if
    end % for
    % 45 46
    cm.Type = c.getType;
    cm.Parentable = c.getParentable;
end % function
