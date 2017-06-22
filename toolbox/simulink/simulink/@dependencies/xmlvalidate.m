function [valid, msg, s] = xmlvalidate(xmlfile, schemafile)
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
    if not(exist(schemafile, 'file'))
        error('Schema file not found: %s', schemafile);
    end
    % 22 24
    valid = true;
    msg = '';
    s = struct('LineNumber', {}, 'ColumnNumber', {}, 'Message', {});
    % 26 28
    d = dir(xmlfile);
    if isempty(d)
        error('XML file not found: %s', xmlfile);
    else
        if eq(d(1.0).bytes, 0.0)
            valid = false;
            msg = 'The XML file is empty';
            return
        end
    end
    v = com.mathworks.xml.XMLValidator;
    results = v.validateFile(xmlfile, schemafile);
    if isempty(results)
        valid = false;
        % 41 43
        msg = 'The schema file is invalid. See command window for details';
    else
        if results.hasErrors()
            valid = false;
            msg = char(results.getSimpleStringMessage());
            vec = results.getErrors;
            for i=1.0:vec.size()
                spe = vec.elementAt(minus(i, 1.0));
                s(i).LineNumber = double(spe.getLineNumber());
                s(i).ColumnNumber = double(spe.getColumnNumber());
                s(i).Message = char(spe.getMessage());
            end % for
        end
    end
end
