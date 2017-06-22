function makehdlcheckreport(this, checks)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    nname = this.StartNodeName;
    bname = get(this.ModelConnection.StartNode, 'Nodename');
    % 8 10
    crs = find(eq(nname, char(10.0)));
    nname(crs) = ' ';
    % 11 14
    % 12 14
    hdlmakecodegendir;
    % 14 17
    % 15 17
    codegendir = hdlgetparameter('codegendir');
    fileName = horzcat(hdllegalname(bname), '_report.html');
    fopenName = fullfile(codegendir, fileName);
    fid = fopen(fopenName, 'w');
    % 20 22
    if eq(fid, -1.0)
        error(hdlcodererrormsgid('cannotopenfile'), horzcat('Cannot open file ''', fileName, '''.'));
        % 23 25
    end % if
    % 25 27
    fprintf(fid, '<html>\n');
    fprintf(fid, '<head>\n');
    fprintf(fid, '<title>HDL Check Report for %s</title>\n', nname);
    fprintf(fid, '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\n');
    fprintf(fid, '</head>\n');
    fprintf(fid, '<body bgcolor="#FFFFFF" text="#000000">\n');
    fprintf(fid, '<font face="Arial, Helvetica, sans-serif"> \n');
    fprintf(fid, '<h2><font face="Arial, Helvetica, sans-serif" color="#990000">');
    fprintf(fid, 'HDL Code Generation Check Report for\n');
    fprintf(fid, '<a href="matlab:open_system(''%s'');">%s</a><BR>\n', nname, nname);
    % 36 38
    fprintf(fid, 'Generated on %s</font></h2>\n', datestr(now, 31.0));
    if isempty(checks)
        fprintf(fid, '<p>No messages, warnings, or errors were found.<BR>\n');
    else
        fprintf(fid, '<p>The following table describes the blocks that failed one or more\n');
        fprintf(fid, 'checks for HDL code generation.<BR>\n');
        fprintf(fid, '<TABLE border=1 width=800>\n');
        % 44 46
        fprintf(fid, '<TR><TD> <B>Simulink Block</B> </TD>');
        fprintf(fid, '<TD> <B>Level</B> </TD>');
        fprintf(fid, '<TD> <B>Description</B> </TD></TR>');
        % 48 51
        % 49 51
        errs = [];
        warns = [];
        messg = [];
        for n=1.0:length(checks)
            switch lower(checks(n).level)
            case 'error'
                errs = horzcat(errs, checks(n));
            case 'warning'
                warns = horzcat(warns, checks(n));
            case 'message'
                messg = horzcat(messg, checks(n));
            otherwise
                errs = horzcat(errs, checks(n));
            end % switch
        end % for
        % 65 67
        checks = [];
        if not(isempty(errs))
            checks = horzcat(checks, errs);
        end % if
        if not(isempty(warns))
            checks = horzcat(checks, warns);
        end % if
        if not(isempty(messg))
            checks = horzcat(checks, messg);
        end % if
        % 76 79
        % 77 79
        for n=1.0:length(checks)
            cblk = checks(n).path;
            % 80 82
            fprintf(fid, '<TR><TD>\n');
            hilitename = horzcat('''', cblk, '''');
            crs = find(eq(hilitename, char(10.0)));
            hilitename(crs) = ' ';
            switch lower(checks(n).type)
            case 'synthetic'
                sep = findstr(hilitename, '/');
                if not(isempty(sep))
                    hilitename = horzcat(hilitename(1.0:minus(sep(end), 1.0)), '''');
                end % if
                fprintf(fid, '<a href="matlab:hilite(get_param(''%s'',''object''),''none'');open_system(%s)">%s (synthetic)</a>\n', get_param(bdroot, 'Name'), hilitename, cblk);
                % 93 96
                % 94 96
            case {'model'}
                % 95 97
                fprintf(fid, '<a href="matlab:hilite(get_param(''%s'',''object''),''none'');open_system(''%s'')">%s</a>\n', get_param(bdroot, 'Name'), get_param(bdroot, 'Name'), cblk);
            otherwise
                % 98 100
                % 99 101
                fprintf(fid, '<a href="matlab:hilite(get_param(''%s'',''object''),''none'');hilite_system(%s)">%s</a>\n', get_param(bdroot, 'Name'), hilitename, cblk);
                % 101 104
                % 102 104
            end % switch
            fprintf(fid, '</TD>\n');
            fprintf(fid, '<TD>%s</TD>\n', checks(n).level);
            fprintf(fid, '<TD>%s</TD>\n', checks(n).message);
            fprintf(fid, '</TR>\n');
        end % for
    end % if
    % 110 113
    % 111 113
    fprintf(fid, '</TABLE>\n');
    fprintf(fid, '</body>\n');
    fprintf(fid, '</html>\n');
    % 115 118
    % 116 118
    fclose(fid);
    % 118 121
    % 119 121
    pause(1.0);
    % 121 123
    if not(isempty(dir(fullfile(pwd, codegendir, fileName))))
        nameforuser = fullfile(pwd, codegendir, fileName);
    else
        if not(isempty(dir(fullfile(codegendir, fileName))))
            nameforuser = fullfile(codegendir, fileName);
        else
            error(hdlcodererrormsgid('fullfilenamenotfound'), 'Cannot determine full file name for report file.')
        end % if
        % 130 132
    end % if
    status = web(horzcat('file:////', nameforuser));
    switch status
    case 1.0
        error(hdlcodererrormsgid('webbrowsernotfound'), 'Web browser not found')
    case 2.0
        error(hdlcodererrormsgid('webbrowserfailed'), 'Web browser cannot be launched')
    otherwise
        % 139 142
        % 140 142
    end % switch
