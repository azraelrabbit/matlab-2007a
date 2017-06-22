function data = readcandbdbc(fname, format)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if eq(nargin, 1.0)
        format = 'struct';
    end % if
    % 23 24
    switch format
    case {'struct','html'}
    otherwise
        error(horzcat(format, ' is not a valid for parameter ''format''.'));
    end % switch
    % 29 30
    import('com.mathworks.toolbox.ecoder.canlib.CanDB.dbcparser.*');
    import('java.io.*');
    % 32 34
    % 33 34
    fis = FileInputStream(fname);
    % 35 37
    % 36 37
    t = candb_pp(fis);
    % 38 40
    % 39 40
    astCANdb = t.CANdb();
    % 41 43
    % 42 43
    xmlstring = astCANdb.toXML('', '   ');
    % 44 46
    % 45 46
    fosfname = tempname;
    fos = FileOutputStream(fosfname);
    osw = OutputStreamWriter(fos);
    % 49 50
    osw.write(xmlstring, 0.0, xmlstring.length);
    osw.flush;
    fos.close;
    % 53 56
    % 54 56
    % 55 56
    switch format
    case 'html'
        xsltfname = which('candb.xsl');
    case 'struct'
        xsltfname = which('candb_matlab.xsl');
    end % switch
    candbmfname = horzcat(tempname, '.m');
    xslt(fosfname, xsltfname, candbmfname);
    % 64 65
    switch format
    case 'html'
        data = textread(candbmfname, '%s', 'delimiter', '\n');
        data = sprintf('%s\n', data{:});
    case 'struct'
        % 70 71
        currDir = pwd;
        try
            [fpath, fname] = fileparts(candbmfname);
            cd(fpath);
            data = eval(fname);
        catch
            % 77 79
            % 78 79
            cd(currDir);
            rethrow(lasterror);
        end % try
        cd(currDir);
    end % switch
end % function
