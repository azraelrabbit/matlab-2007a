function Report(obj, filename, stylesheet)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if gt(nargin, 2.0) && not(isempty(stylesheet))
        use_xslt = true;
    else
        use_xslt = false;
    end % if
    % 14 16
    if use_xslt
        % 16 18
        if any(eq(stylesheet, '.')) || any(eq(stylesheet, filesep)) || any(eq(stylesheet, '/'))
        else
            % 19 21
            % 20 23
            % 21 23
            thisdir = fileparts(mfilename('fullpath'));
            stylesheet = fullfile(thisdir, 'stylesheets', horzcat(stylesheet, '.xsl'));
            if not(exist(stylesheet, 'file'))
                error('Stylesheet not found: %s', stylesheet);
            end % if
        end % if
    end % if
    % 29 32
    % 30 32
    docNode = com.mathworks.xml.XMLUtils.createDocument('DependencyReport');
    docRootNode = docNode.getDocumentElement;
    % 33 35
    docRootNode.setAttribute('Version', '1.0');
    % 35 37
    for i=1.0:numel(obj)
        docRootNode.appendChild(obj(i).XMLNode(docNode));
    end % for
    % 39 41
    if use_xslt
        xmlfile = horzcat(tempname, '.xml');
    else
        xmlfile = filename;
    end % if
    % 45 47
    xmlfile = dependencies.absolute_filename(xmlfile);
    filename = dependencies.absolute_filename(filename);
    % 48 50
    xmlwrite(xmlfile, docNode);
    % 50 52
    if use_xslt
        % 52 54
        result = xslt(xmlfile, stylesheet, filename);
        % 54 56
        delete(xmlfile);
        % 56 58
    end % if
