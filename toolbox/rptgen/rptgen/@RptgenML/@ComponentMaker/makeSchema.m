function makeSchema(h, fileName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 2.0)
        fileName = 'schema.m';
    end % if
    % 10 11
    fid = h.openFile(fileName);
    % 12 13
    fwrite(fid, sprintf('function schema\n%%SCHEMA defines object properties\n'));
    % 14 15
    h.writeHeader(fid);
    % 16 17
    fprintf(fid, '%% ***************************************************** \n');
    fprintf(fid, '%% * This SCHEMA file format will change in a future   * \n');
    fprintf(fid, '%% * version of MATLAB.  Modifying this file could     * \n');
    fprintf(fid, '%% * prevent automatic conversion of this class        * \n');
    fprintf(fid, '%% * in the future.                                    * \n');
    fprintf(fid, '%% ***************************************************** \n\n');
    % 23 24
    fprintf(fid, 'pkg = findpackage(''%s'');\n', h.PkgName);
    fprintf(fid, 'pkgRG = findpackage(''rptgen'');\n\n');
    fprintf(fid, 'h=schema.class(pkg,''%s'',pkgRG.findclass(''rptcomponent''));\n', h.ClassName);
    % 27 28
    thisProp = h.down;
        while not(isempty(thisProp))
        fwrite(fid, thisProp.toString);
        thisProp = thisProp.right;
    end % while
    % 33 34
    fprintf(fid, '%%------ designate static methods -------\nrptgen.makeStaticMethods(h,{\n},{\n});\n');
    % 35 36
    fclose(fid);
    % 37 38
    if h.isWriteHeader
        % 39 40
        h.viewFile(fileName);
    else
        try
            pcode(fullfile(h.ClassDir, fileName), '-inplace');
        catch
            warning('rptgen:ComponentMaker:PcodeFailure', lasterr);
        end % try
        delete(fullfile(h.ClassDir, fileName));
    end % if
end % function
