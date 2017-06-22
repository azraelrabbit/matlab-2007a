function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pkg = findpackage('rptgen');
    pkgXML = findpackage('rpt_xml');
    % 8 10
    h = schema.class(pkg, 'coutline', pkg.findclass('rpt_section'));
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    rptgen.makeStaticMethods(h, {}, {'cleanup';'doDelete';'getrptname';'getSectionType';'getChunkFileName';'getSectionFileName';'initialize';'makeDocumentPost';'makeDocumentPre';'viewFile';'getContextMenu';'getDirty';'setDirty';'getDisplayIcon';'mcodeConstructor';'writeXmlHeader'});
    % 15 37
    % 16 37
    % 17 37
    % 18 37
    % 19 37
    % 20 37
    % 21 37
    % 22 37
    % 23 37
    % 24 37
    % 25 37
    % 26 37
    % 27 37
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    p = rptgen.prop(h, 'DirectoryType', vertcat(cellhorzcat('setfile', xlate('Same as setup file')), cellhorzcat('pwd', xlate('Present working directory')), cellhorzcat('tempdir', xlate('Temporary directory')), cellhorzcat('other', horzcat(xlate('Custom'), ':'))), 'setfile', xlate('Directory:'), 1.0);
    % 37 45
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    p = rptgen.prop(h, 'DirectoryName', rptgen.makeStringType, '', '', 1.0);
    % 45 47
    p = rptgen.prop(h, 'FilenameType', vertcat(cellhorzcat('setfile', xlate('Same as setup file')), cellhorzcat('other', horzcat(xlate('Custom'), ':'))), 'setfile', xlate('Filename:'), 1.0);
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    p = rptgen.prop(h, 'FilenameName', rptgen.makeStringType, 'index', '', 1.0);
    % 53 55
    p = rptgen.prop(h, 'isIncrementFilename', 'bool', false, xlate('If report already exists, increment to prevent overwriting'), 1.0);
    % 55 58
    % 56 58
    pkgXML.findclass('db_output');
    p = rptgen.prop(h, 'Output', 'rpt_xml.db_output');
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @getOutput;
    p.SetFunction = @setOutput;
    p.Visible = 'off';
    % 67 74
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    p = rptgen.prop(h, 'Format', 'rptgen_docbook_target');
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @getFormat;
    p.SetFunction = @setFormat;
    % 80 82
    p = rptgen.prop(h, 'Stylesheet', 'String');
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @getStylesheet;
    p.SetFunction = @setStylesheet;
    % 88 90
    p = rptgen.prop(h, 'isView', 'bool', true, xlate('View report after generation'), 1.0);
    % 90 93
    % 91 93
    p = rptgen.prop(h, 'ForceXmlSource', 'bool', false, xlate('Always retain XML source file after conversion'), 1.0);
    % 93 96
    % 94 96
    p = rptgen.prop(h, 'isAutoSaveOnGenerate', 'bool', false, xlate('Auto save before generation'));
    % 96 99
    % 97 99
    p = rptgen.prop(h, 'isRegenerateImages', 'bool', true, xlate('Re-generate Simulink && Stateflow images'));
    % 99 102
    % 100 102
    p = rptgen.prop(h, 'isDebug', 'bool', false, 'Debug mode');
    p.Visible = 'off';
    % 103 105
    p = rptgen.prop(h, 'Description', 'String', xlate('A report'), xlate('Report description'));
    % 105 110
    % 106 110
    % 107 110
    % 108 110
    p = rptgen.prop(h, 'Language', rpt_xml.typeLanguage, 'auto', xlate('Language'));
    % 110 113
    % 111 113
    p = rptgen.prop(h, 'PostGenerateFcn', 'String', '', xlate('Evaluate this string after generation'));
    % 113 119
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    p = rptgen.prop(h, 'RptFileName', 'String', '', '', 2.0);
    p.Visible = 'on';
    % 120 122
    pkg.findclass('appdata');
    p = rptgen.prop(h, 'ApplicationDataObjects', 'rptgen.appdata vector', [], '', 2.0);
    % 123 125
    p = rptgen.prop(h, 'RuntimeFileEncoding', 'string', '', '', 2.0);
    % 125 128
    % 126 128
    p = rptgen.prop(h, 'PublicGenerate', 'bool', false);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Default = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Copy = 'off';
    p.Visible = 'off';
    p.FactoryValue = false;
    % 135 138
    % 136 138
    locSetSignature(h, 'getContextMenu', {'handle','handle vector'}, {'handle'});
    locSetSignature(h, 'getDisplayIcon', {'handle'}, {'string'});
end
function locSetSignature(clsH, methodName, inputTypes, outputTypes)
    % 141 145
    % 142 145
    % 143 145
    m = find(clsH.Method, 'Name', methodName);
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = inputTypes;
        s.OutputTypes = outputTypes;
    end
end
function returnedValue = getOutput(this, storedValue)
    % 153 156
    % 154 156
    returnedValue = find(this, '-depth', 1.0, '-isa', 'rpt_xml.db_output');
    % 156 160
    % 157 160
    % 158 160
    if isempty(returnedValue)
        if not(isempty(storedValue))
            % 161 163
            setOutput(this, storedValue);
            returnedValue = storedValue
        else
            % 165 167
            returnedValue = rpt_xml.db_output;
            connect(returnedValue, this, 'up');
        end
    else
        % 170 172
        returnedValue = returnedValue(1.0);
    end
end
function valueStored = setOutput(this, proposedValue)
    % 175 178
    % 176 178
    if isempty(proposedValue)
        return
    else
        if not(isa(proposedValue, 'rpt_xml.db_output'))
            error('Output value must be rpt_xml.db_output');
        end
    end
    valueStored = [];
    existingValue = find(this, '-depth', 1.0, '-isa', 'rpt_xml.db_output');
    % 186 190
    % 187 190
    % 188 190
    for i=1.0:length(existingValue)
        if not(isequal(existingValue(i), proposedValue))
            disconnect(existingValue(i));
        end
    end % for
    % 194 196
    connect(proposedValue, this, 'up');
end
function returnedValue = getFormat(this, storedValue)
    % 198 202
    % 199 202
    % 200 202
    o = getOutput(this, []);
    returnedValue = o.Format;
end
function valueStored = setFormat(this, proposedValue)
    % 205 208
    % 206 208
    o = getOutput(this, []);
    o.Format = proposedValue;
    valueStored = proposedValue;
end
function returnedValue = getStylesheet(this, storedValue)
    % 212 215
    % 213 215
    o = getOutput(this, []);
    returnedValue = o.getStylesheetID;
end
function valueStored = setStylesheet(this, proposedValue)
    % 218 221
    % 219 221
    o = getOutput(this, []);
    o.setStylesheetID(proposedValue);
    valueStored = '';
end
