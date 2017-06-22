function writeHtmlHelp(this, fName)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if lt(nargin, 2.0)
        fName = '_help.html';
    end
    % 15 17
    if isa(this, 'RptgenML.ComponentMaker')
        fid = this.openFile(fName);
        dName = this.DisplayName;
        clsName = horzcat(this.PkgName, '.', this.ClassName);
        desc = this.Description;
        compType = this.Type;
    else
        if isa(this, 'rptgen.rptcomponent')
            fid = fopen(fName, 'w');
            dName = this.getName;
            clsName = class(this);
            desc = this.getDescription;
            compType = this.getType;
        else
            error('Invalid input argument');
        end
    end
    dName = escapeHtml(dName);
    desc = escapeHtml(desc);
    compType = escapeHtml(compType);
    fprintf(fid, '<html><head><title>%s (Report Generator)</title>\n', dName);
    % 37 40
    % 38 40
    fprintf(fid, '<link rel=stylesheet href="docstyle1.css" type="text/css">\n');
    % 40 42
    fprintf(fid, '</head>\n<body bgcolor="#ffffff">\n');
    % 42 45
    % 43 45
    fprintf(fid, '\n<table border=0 width="100%%" cellpadding=0 cellspacing=0><tr>\n');
    fprintf(fid, '<td valign=baseline bgcolor="#e7ebf7"><b>Report Generator</b></td>\n');
    fprintf(fid, '<!-- Navigation Arrows\n<td valign=baseline bgcolor="#e7ebf7" align=right>\n<a href="PREV.html"><img src="b_prev.gif" alt="Previous page" border=0></a>\n&nbsp;&nbsp;&nbsp;\n<a href="NEXT.html"><img src="b_next.gif" alt="Next Page" border=0></a>\n</td>\n-->\n');
    fprintf(fid, '</tr></table>\n');
    % 48 51
    % 49 51
    fprintf(fid, '<a name="obj.%s"></a><font size="+3" color="#990000">%s</font>\n', clsName, dName);
    % 51 55
    % 52 55
    % 53 55
    fprintf(fid, '\n<a name="category"></a><!-- H2 --><br><font size="+1" color="#990000"><b>Category</b></font><br class="hdr">\n<p>%s</p>\n', compType);
    % 55 59
    % 56 59
    % 57 59
    fprintf(fid, '\n<a name="description"></a><!-- H2 --><p><font size="+1" color="#990000"><b>Description</b></font><br class="hdr">\n<p>%s</p>\n', desc);
    % 59 63
    % 60 63
    % 61 63
    fprintf(fid, '\n<a name="attributes"></a><!-- H2 --><p><font size="+1" color="#990000"><b>Attributes</b></font><br class="hdr">\n');
    fprintf(fid, '\n<!--<p>The following figure shows the <strong>%s</strong> properties panel:</p>\n<p><img src="_screenshot.png" alt="" align=bottom></p>-->\n', dName);
    % 64 67
    % 65 67
    fprintf(fid, '\n<!--<a name="group_header_XX"></a><p><font size="+1" color="#990000"><b>Group Header XX</b></font><br class="hdr">-->\n');
    % 67 69
    fprintf(fid, '\n<dl>\n');
    % 69 71
    if isa(this, 'RptgenML.ComponentMaker')
        thisProp = this.down;
        while not(isempty(thisProp))
            writeHelp(thisProp, fid);
            thisProp = thisProp.right;
        end % while
    else
        if isa(this, 'rptgen.rptcomponent')
            allProp = get(classhandle(this), 'Properties');
            superProp = get(findclass(findpackage('rptgen'), 'rptcomponent'), 'Properties');
            % 80 82
            allPropNames = get(allProp, 'Name');
            superPropNames = get(superProp, 'Name');
            [thisPropNames, thisPropIdx] = setdiff(allPropNames, superPropNames);
            allProp = allProp(thisPropIdx);
            % 85 87
            for i=1.0:length(allProp)
                writeHelp(allProp(i), fid);
            end % for
        end
    end
    fprintf(fid, '</dl>\n');
    % 92 94
    fprintf(fid, '\n<!--<a name="example"></a><p><font color="#990000"><b>Example</b></font><br class="hdr">\n<p>This is an example</p>-->\n');
    % 94 96
    fprintf(fid, '\n<a name="insert_anything_into_report?"></a><!-- H2 --><p><font size="+1" color="#990000"><b>Insert Anything into Report?</b></font><br class="hdr">\n<p>Yes. <!-- Table/Text/Chapter/Image --></p>\n');
    % 96 98
    fprintf(fid, '\n<a name="filename"></a><!-- H2 --><p><font size="+1" color="#990000"><b>Filename</b></font><br class="hdr">\n<p><code>%s</code></p>\n', clsName);
    % 98 101
    % 99 101
    fprintf(fid, '\n<!-- Navigation Table\n<table bgcolor="#e7ebf7" border=0 width="100%%" cellpadding=0 cellspacing=0><tr valign=top><td align=left width=20>\n<a href="PREV.html"><img src="b_prev.gif" alt="Previous page" border=0 align=bottom></a>&nbsp;</td>td align=left>&nbsp;Previous Page</td>\n<td>&nbsp;</td>\n<td align=right>Next Page&nbsp;</td><td align=right width=20><a href="NEXT.html"><img src="b_next.gif" alt="Next page" border=0 align=bottom></a></td>\n</tr></table>\n-->\n');
    % 101 108
    % 102 108
    % 103 108
    % 104 108
    % 105 108
    % 106 108
    fprintf(fid, '\n</body>\n</html>');
    % 108 110
    fclose(fid);
    % 110 112
    if isa(this, 'RptgenML.ComponentMaker')
        this.viewFile(fName);
    else
        if isa(this, 'rptgen.rptcomponent')
            edit(fName);
        end
    end
end
function writeHelp(this, fid)
    if isa(this, 'RptgenML.ComponentMakerData')
        desc = this.Description;
        if isempty(desc)
            desc = this.PropertyName;
        end
        dataType = this.DataTypeString;
        eNames = this.EnumNames;
        eValues = this.EnumValues;
    else
        if strcmp(this.Visible, 'off') || strcmp(this.AccessFlags.PublicSet, 'off')
            return
        end
        desc = this.Description;
        if isempty(desc)
            desc = this.Name;
        end
        dataType = this.DataType;
        dt = findtype(dataType);
        if isa(dt, 'rptgen.enum')
            dataType = '!enumeration';
            eNames = dt.DisplayNames;
            eValues = dt.Strings;
        end
    end
    % 144 146
    desc = escapeHtml(desc);
    % 146 149
    % 147 149
    fprintf(fid, '<dt><b>%s</b></dt>\n<dd>(Description) ', desc);
    % 149 151
    if strcmpi(dataType, '!enumeration')
        nameCount = length(eNames);
        fprintf(fid, '\n<ul>\n');
        for i=1.0:length(eValues)
            if le(i, nameCount)
                eName = eNames{i};
            else
                eName = eValues{i};
            end
            fprintf(fid, '<li><code>%s</code> -- (Description)</li>\n', escapeHtml(eName));
        end % for
        fprintf(fid, '</ul>\n');
    end
    % 163 165
    if strcmpi(dataType, rptgen.makeStringType)
        fprintf(fid, 'Supports the <code>%%&lt;varname&gt;</code> notation.');
    end
    % 167 169
    fprintf(fid, '</dd>\n');
end
function str = escapeHtml(str)
    % 171 177
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    str = strrep(str, '&', '&amp;');
    str = strrep(str, '<', '&lt;');
    str = strrep(str, '>', '&gt;');
end
