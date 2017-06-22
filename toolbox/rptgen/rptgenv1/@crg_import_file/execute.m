function out = execute(c)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    fName = parsevartext(c.rptcomponent, c.att.FileName);
    % 8 10
    if strcmp(c.att.ImportType, 'external')
        % 10 12
        fullName = which(fName);
        if not(isempty(fullName))
            fName = fullName;
        end
        fName = strrep(fName, '\', '/');
        % 16 18
        out = char(javaMethod('importExternalFile', 'com.mathworks.toolbox.rptgencore.docbook.FileImporter', fName));
        % 18 21
        % 19 21
        c.rptcomponent.ScanDocumentForImports = logical(1);
        return
    end
    % 23 25
    out = '';
    % 25 27
    fid = fopen(fName, 'r');
    if gt(fid, 0.0)
        out = char(fread(fid, Inf, 'char'));
        fclose(fid);
        % 30 32
        if not(isempty(out))
            out = strrep(ctranspose(out), char(13.0), '');
            % 33 35
            switch c.att.ImportType
            case 'text'
            case 'para-lb'
                out = DelimitedParagraph(out, 1.0);
            case 'para-emptyrow'
                out = DelimitedParagraph(out, 2.0);
            case 'honorspaces'
                out = set(sgmltag, 'tag', 'LiteralLayout', 'data', out, 'indent', logical(0));
                % 43 46
                % 44 46
            case 'fixedwidth'
                % 45 47
                out = set(sgmltag, 'tag', 'ProgramListing', 'data', out, 'indent', logical(0));
                % 48 51
                % 49 51
            case 'docbook'
                % 50 52
                out = set(sgmltag, 'data', out, 'isSGML', logical(1));
                % 52 56
                % 53 56
                % 54 56
            end
        else
            status(c, sprintf('Warning - File %s contains no ASCII text.', c.att.FileName), 2.0);
        end
    else
        status(c, sprintf('Error - Could not open file %s.', c.att.FileName), 1.0);
    end
end
function out = DelimitedParagraph(in, numDelim)
    % 64 72
    % 65 72
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    delim = char(mtimes(10.0, ones(1.0, numDelim)));
    delimLoc = horzcat(minus(1.0, numDelim), findstr(in, delim), plus(length(in), 1.0));
    % 73 75
    out = {};
    for i=1.0:minus(length(delimLoc), 1.0)
        delimString = in(plus(delimLoc(i), numDelim):minus(delimLoc(plus(i, 1.0)), 1.0));
        if not(all(isspace(delimString)))
            out{plus(end, 1.0)} = set(sgmltag, 'tag', 'Para', 'data', delimString);
            % 79 82
            % 80 82
        end
    end % for
end
