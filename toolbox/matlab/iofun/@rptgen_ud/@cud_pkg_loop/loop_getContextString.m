function cs = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if strcmp(c.LoopType, 'directory')
        cs = sprintf('All packages in directory %s', c.DirectoryName);
    else
        cs = rptgen.toString(c.PackageList, ' ');
        if gt(length(cs), 16.0)
            cs = horzcat(cs(1.0:13.0), '...');
        end % if
    end % if
