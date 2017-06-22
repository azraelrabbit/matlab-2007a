function hList = loop_getLoopObjects(cLoop)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    hList = [];
    if strcmp(cLoop.LoopType, 'directory')
        dirName = rptgen.parseExpressionText(cLoop.DirectoryName);
        if eq(exist(dirName, 'dir'), 0.0)
            cLoop.status(sprintf('Directory "%s" does not exist.', dirName), 2.0);
            return;
        end % if
        % 15 17
        atDirs = dir(fullfile(dirName, '@*'));
        for i=1.0:length(atDirs)
            pkgName = atDirs(i).name(2.0:end);
            if not(isempty(pkgName))
                % 20 22
                hList = vertcat(hList, findpackage(pkgName));
            end % if
        end % for
    else
        % 25 27
        for i=1.0:length(cLoop.PackageList)
            hList = vertcat(hList, findpackage(rptgen.parseExpressionText(cLoop.PackageList{i})));
            % 28 31
            % 29 31
        end % for
    end % if
