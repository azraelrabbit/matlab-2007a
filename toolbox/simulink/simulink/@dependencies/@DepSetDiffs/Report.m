function Report(obj, filename, stylesheet)
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
    if gt(nargin, 2.0) && not(isempty(stylesheet))
        use_xslt = true;
    else
        use_xslt = false;
    end % if
    % 17 19
    if use_xslt
        % 19 21
        if any(eq(stylesheet, '.')) || any(eq(stylesheet, filesep)) || any(eq(stylesheet, '/'))
        else
            % 22 24
            % 23 26
            % 24 26
            thisdir = fileparts(mfilename('fullpath'));
            stylesheet = fullfile(thisdir, 'stylesheets', horzcat(stylesheet, '.xsl'));
            if not(exist(stylesheet, 'file'))
                error('Stylesheet not found: %s', stylesheet);
            end % if
        end % if
    end % if
    % 32 35
    % 33 35
    docNode = com.mathworks.xml.XMLUtils.createDocument('DependencyDifferencesReport');
    docRootNode = docNode.getDocumentElement;
    % 36 38
    docRootNode.setAttribute('Version', '1.0');
    % 38 40
    for i=1.0:numel(obj)
        docRootNode.appendChild(obj(i).XMLNode(docNode));
    end % for
    % 42 44
    if use_xslt
        xmlfile = horzcat(tempname, '.xml');
    else
        xmlfile = filename;
    end % if
    % 48 50
    xmlfile = dependencies.absolute_filename(xmlfile);
    filename = dependencies.absolute_filename(filename);
    % 51 53
    xmlwrite(xmlfile, docNode);
    % 53 55
    if use_xslt
        % 55 57
        xslt(xmlfile, stylesheet, filename);
        delete(xmlfile);
    end % if
