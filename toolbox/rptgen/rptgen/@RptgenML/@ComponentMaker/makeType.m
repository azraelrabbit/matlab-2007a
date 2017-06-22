function makeType(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fid = this.openFile('getType.m');
    % 8 9
    fprintf(fid, 'function compCategory=getType\n');
    fprintf(fid, '%%GETTYPE Declare component category membership\n');
    fprintf(fid, '%%  CATEGORY = COMPONENT.GETTYPE returns the name of the\n');
    fprintf(fid, '%%    component''s category in the options palette.\n');
    fprintf(fid, '\n');
    fprintf(fid, '%%  This method is static and does not change \n');
    fprintf(fid, '%%  depending on component properties.\n');
    fprintf(fid, '\n');
    fprintf(fid, '%%  Note that CATEGORY information is duplicated in\n');
    fprintf(fid, '%%  the file ../rptcomps2.xml.  Any changes here should\n');
    fprintf(fid, '%%  be updated there as well.\n\n');
    % 20 22
    % 21 22
    this.writeHeader(fid);
    % 23 24
    typeClean = strrep(this.Type, char(10.0), ' ');
    typeClean = strrep(typeClean, char(13.0), ' ');
    % 26 27
    typeEscaped = strrep(typeClean, '''', '''''');
    % 28 30
    % 29 30
    fprintf(fid, 'compCategory = ''%s'';\n', typeEscaped);
    fprintf(fid, '\n%% If all components in a package share the same Type, \n%% Type can also be defined at the package level with a static method\n%%compCategory = %s.getType;\n', this.PkgName);
    % 32 34
    % 33 34
    r = RptgenML.Root;
    if isempty(r.Library)
        % 36 38
        % 37 38
        catObj = [];
    else
        catObj = find(r.Library, '-depth', 1.0, '-isa', 'RptgenML.LibraryCategory', 'CategoryName', typeClean);
        % 41 44
        % 42 44
        % 43 44
    end % if
    % 45 46
    if isempty(catObj)
        % 47 49
        % 48 49
        this.TypeHelpFile = fullfile(this.PkgDir, horzcat('@', this.PkgName), sprintf('_help_%s.html', strrep(typeClean, ' ', '_')));
        % 50 52
        % 51 52
        if not(exist(this.TypeHelpFile, 'file'))
            htmlFID = fopen(this.TypeHelpFile, 'w');
            if gt(htmlFID, 0.0)
                fprintf(htmlFID, '<html>\n');
                fprintf(htmlFID, '<head><title>%s Components :: Component Reference (MATLAB and Simulink Report Generator)</title>\n', this.Type);
                fprintf(htmlFID, '<link rel=stylesheet href="docstyle1.css" type="text/css">\n');
                fprintf(htmlFID, '</head>\n');
                fprintf(htmlFID, '<body bgcolor=#ffffff>\n');
                fprintf(htmlFID, '<table border=0 width="100%" cellpadding=0 cellspacing=0><tr>\n');
                fprintf(htmlFID, '<td valign=baseline bgcolor="#e7ebf7"><b>MATLAB and Simulink Report Generator</b></td>\n');
                fprintf(htmlFID, '<td valign=baseline bgcolor="#e7ebf7" align=right>\n');
                fprintf(htmlFID, '<!--<a href="ref_int5.html"><img src="b_prev.gif" alt="Previous page" border=0></a>\n');
                fprintf(htmlFID, '&nbsp;&nbsp;&nbsp;\n');
                fprintf(htmlFID, '<a href="ref_int7.html"><img src="b_next.gif" alt="Next Page" border=0></a></td>-->\n');
                fprintf(htmlFID, '</tr>\n');
                fprintf(htmlFID, '</table>\n');
                fprintf(htmlFID, '<p><font size=+1 color="#990000"><b>%s Components</b></font><br class="hdr">\n', this.Type);
                fprintf(htmlFID, '<p><a name="category.%s"></a> </p>\n', strrep(this.Type, ' ', '_'));
                fprintf(htmlFID, '<p>The following table describes the %s components.<br><br>\n', this.Type);
                fprintf(htmlFID, '<table Border="2" cellpadding=4 cellspacing=0>\n');
                fprintf(htmlFID, '<caption></caption>\n');
                fprintf(htmlFID, '<tr valign=top><th align=left><b>Component</b><br></th>\n');
                fprintf(htmlFID, '<th align=left><b>Description</b><br></th>\n');
                fprintf(htmlFID, '<tr valign=top><td><a href="./@%s/_help.html">%s</a><br></td>\n', this.ClassName, this.DisplayName);
                fprintf(htmlFID, '<td>%s<br></td>\n', this.Description);
                fprintf(htmlFID, '</table>\n');
                fprintf(htmlFID, '<br>\n');
                fprintf(htmlFID, '</body>\n');
                fprintf(htmlFID, '</html>\n');
                % 81 82
                fclose(htmlFID);
                % 83 84
                fprintf(fid, '\n%% HTML help file for category auto-generated at\n%% %s\n', this.TypeHelpFile);
                % 85 86
            end % if
        end % if
    else
        this.TypeHelpFile = '';
    end % if
    % 91 92
    fclose(fid);
    % 93 94
    this.viewFile('getType.m', 2.0);
end % function
