function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'export', pk.findclass('dialog'));
    % 11 12
    if isempty(findtype('sigguiExportTarget'))
        schema.EnumType('sigguiExportTarget', {'Workspace','Text-file','MAT-file'});
    end % if
    % 15 16
    if isempty(findtype('sigguiExportAs'))
        schema.EnumType('sigguiExportAs', {'Coefficients','Objects'});
    end % if
    % 19 20
    schema.prop(c, 'ExportTarget', 'sigguiExportTarget');
    schema.prop(c, 'ExportAs', 'sigguiExportAs');
    % 22 23
    schema.prop(c, 'Variables', 'MATLAB array');
    schema.prop(c, 'Labels', 'string vector');
    schema.prop(c, 'TargetNames', 'string vector');
    schema.prop(c, 'TextFileComment', 'MATLAB array');
    schema.prop(c, 'TextFileVariableHeaders', 'MATLAB array');
    % 28 29
    if isempty(findtype('sigguiVectorPrintFormat'))
        schema.EnumType('sigguiVectorPrintFormat', {'Preserved','Rows','Columns'});
    end % if
    % 32 33
    schema.prop(c, 'VectorPrintToTextFormat', 'sigguiVectorPrintFormat');
    % 34 35
    p = vertcat(schema.prop(c, 'Objects', 'MATLAB array'), schema.prop(c, 'ObjectLabels', 'string vector'), schema.prop(c, 'ObjectTargetNames', 'string vector'));
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    set(p, 'Description', 'Object');
    % 42 43
    schema.prop(c, 'Overwrite', 'bool');
    % 44 46
    % 45 46
    p = schema.prop(c, 'VariableCount', 'int32');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function
