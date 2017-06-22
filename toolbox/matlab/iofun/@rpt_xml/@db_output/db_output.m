function o = db_output(varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    o = rpt_xml.db_output;
    % 17 19
    if isempty(varargin)
        return
    end
    % 21 23
    srcExt = char(getExtension(com.mathworks.toolbox.rptgencore.output.OutputFormat.getFormat('db')));
    o.SrcFileName = rptgen.findFile(varargin{1.0}, srcExt, logical(1));
    % 24 26
    if gt(length(varargin), 1.0)
        o.Format = varargin{2.0};
    end
    % 28 30
    if gt(length(varargin), 2.0)
        try
            o.setStylesheet(varargin{3.0});
        catch
            warning(sprintf('"%s" is not a valid stylesheet.\nUse getStylesheetList to find valid stylesheet names.', varargin{3.0}));
            % 34 36
        end % try
    end
    % 37 39
    dstExt = char(o.getFormat.getExtension);
    if gt(length(varargin), 3.0)
        o.DstFileName = rptgen.findFile(varargin{4.0}, dstExt, logical(1));
    else
        [inPath, inFile, inExt] = fileparts(o.SrcFileName);
        o.DstFileName = fullfile(inPath, horzcat(inFile, '.', dstExt));
    end
end
