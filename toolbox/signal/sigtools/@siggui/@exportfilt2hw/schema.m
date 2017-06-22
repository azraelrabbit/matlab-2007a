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
    pk.findclass('targetselector');
    % 11 12
    c = schema.class(pk, 'exportfilt2hw', pk.findclass('exportheader'));
    % 13 14
    if isempty(findtype('exportfilt2hwExportMode'))
        schema.EnumType('exportfilt2hwExportMode', {'C header file','Write directly to memory'});
    end % if
    % 17 19
    % 18 19
    p = vertcat(schema.prop(c, 'ExportMode', 'exportfilt2hwExportMode'), schema.prop(c, 'DisableWarnings', 'bool'));
    % 20 22
    % 21 22
end % function
