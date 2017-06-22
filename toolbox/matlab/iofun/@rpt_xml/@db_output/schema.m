function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pkg = findpackage('rpt_xml');
    pkgRG = findpackage('rptgen');
    % 8 10
    clsH = schema.class(pkg, 'db_output', pkgRG.findclass('DAObject'));
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    ofClass = 'com.mathworks.toolbox.rptgencore.output.OutputFormat';
    try
        allFormats = cellstr(char(javaMethod('listAllIDs', ofClass)));
        allDesc = cellstr(char(javaMethod('listAllDescriptions', ofClass)));
    catch
        warning(lasterr);
        allFormats = {'html'};
        allDesc = cellhorzcat(xlate('web (HTML)'));
    end % try
    % 23 25
    defaultFormat = 'html';
    if not(any(strcmpi(allFormats, defaultFormat)))
        defaultFormat = allFormats{1.0};
    end % if
    % 28 30
    enumType = 'rptgen_docbook_target';
    e = rptgen.enum(enumType, allFormats, allDesc);
    % 31 34
    % 32 34
    p = rptgen.prop(clsH, 'Format', enumType, defaultFormat, xlate('File format'), 1.0);
    % 34 38
    % 35 38
    % 36 38
    p = rptgen.prop(clsH, 'FormatObject', 'com.mathworks.toolbox.rptgencore.output.OutputFormat', [], '', 2.0);
    % 38 41
    % 39 41
    p = rptgen.prop(clsH, 'DstFileName', 'String', '', xlate('Destination file'), 2.0);
    % 41 43
    p = rptgen.prop(clsH, 'SrcFileName', 'String', '', xlate('Source file'), 2.0);
    % 43 45
    ssDataType = 'RGStylesheetRef';
    ssRef = findtype(ssDataType);
    if isempty(ssRef)
        ssRef = schema.UserType(ssDataType, 'MATLAB array', @checkStylesheetRef);
    end % if
    % 49 51
    p = rptgen.prop(clsH, 'StylesheetHTML', ssDataType, 'default-html', '', 1.0);
    % 51 53
    p = rptgen.prop(clsH, 'StylesheetFO', ssDataType, 'default-fo', '', 1.0);
    % 53 55
    p = rptgen.prop(clsH, 'StylesheetLaTeX', ssDataType, 'default-latex', '', 1.0);
    % 55 57
    p = rptgen.prop(clsH, 'StylesheetDSSSL', 'String', '!print-NoOptions', '', 1.0);
    % 57 61
    % 58 61
    % 59 61
    p = rptgen.prop(clsH, 'ImportFiles', 'bool', true, '', 2.0);
    % 61 64
    % 62 64
    p = rptgen.prop(clsH, 'Language', 'String', '', '', 2.0);
    % 64 66
    m = find(clsH.Method, 'Name', 'getDialogSchema');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle','string'};
        s.OutputTypes = {'mxArray'};
    end % if
end % function
function ok = checkStylesheetRef(checkValue)
    % 74 77
    % 75 77
    ok = true;
end % function
