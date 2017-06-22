function makeClassDir(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(h.ClassName)
        error('Rptgen:ComponentMaker:NoClassName', 'Class Name is empty');
    end % if
    % 9 11
    [ok, errMsg] = mkdir(fullfile(h.PkgDir, horzcat('@', h.PkgName)), horzcat('@', h.ClassName));
    if eq(ok, 0.0)
        error('Rptgen:ComponentMaker:NoClassDir', 'Could not create class directory');
    end % if
    h.ClassDir = fullfile(h.PkgDir, horzcat('@', h.PkgName), horzcat('@', h.ClassName));
    % 15 17
    rptgen.displayMessage(sprintf('Writing files to directory "%s"', h.ClassDir), 2.0);
