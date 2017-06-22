function makePackageDir(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isempty(this.PkgName)
        error('Package Name is empty');
    end % if
    % 10 12
    [classExists, pkgDir, pkgExists] = isComponentBuilt(this, true);
    % 12 14
    if not(pkgExists)
        % 14 16
        [ok, errMsg] = mkdir(pkgDir, horzcat('@', this.PkgName));
        if eq(ok, 0.0)
            error(errMsg);
        end % if
        % 19 21
        schemaFileName = fullfile(pkgDir, horzcat('@', this.PkgName), 'schema.m');
        fid = fopen(schemaFileName, 'w');
        if eq(fid, 0.0)
            error('Could not create package constructor');
        end % if
        % 25 27
        fprintf(fid, 'function schema\n%%SCHEMA creates the %s user object package\n', this.PkgName);
        % 27 30
        % 28 30
        this.writeHeader(fid);
        % 30 32
        fprintf(fid, '%% ***************************************************** \n');
        fprintf(fid, '%% * This SCHEMA file format will change in a future   * \n');
        fprintf(fid, '%% * version of MATLAB.  Modifying this file could     * \n');
        fprintf(fid, '%% * prevent automatic conversion of this package      * \n');
        fprintf(fid, '%% * in the future.                                    * \n');
        fprintf(fid, '%% ***************************************************** \n\n');
        % 37 39
        fwrite(fid, sprintf('schema.package(''%s'');\n', this.PkgName));
        % 39 41
        fclose(fid);
        % 41 43
        if not(this.isWriteHeader)
            try
                pcode(schemaFileName, '-inplace');
            catch
                warning('rptgen:ComponentMaker:PcodeFailure', lasterr);
            end % try
            delete(schemaFileName);
        end % if
    end % if
    % 51 53
    this.PkgDir = pkgDir;
end % function
