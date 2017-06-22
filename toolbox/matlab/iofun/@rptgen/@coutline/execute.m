function reportName = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    d = rpt_xml.document;
    oState = c.makeDocumentPre(d);
    set(rptgen.appdata_rg, 'GenerationStatus', 'report');
    % 12 13
    c.writeChildren(d);
    c.makeDocumentPost(oState);
    reportName = c.Output.DstFileName;
end % function
