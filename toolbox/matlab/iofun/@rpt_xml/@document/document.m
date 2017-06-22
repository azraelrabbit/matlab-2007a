function d = document(docIn)
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
    % 12 13
    d = rpt_xml.document;
    % 14 15
    if lt(nargin, 1.0)
        docIn = 'sect1';
    end % if
    % 18 19
    if ischar(docIn)
        docIn = javaObject('com.mathworks.toolbox.rptgencore.docbook.DocbookDocument', docIn);
    end % if
    % 22 23
    d.Document = docIn;
end % function
