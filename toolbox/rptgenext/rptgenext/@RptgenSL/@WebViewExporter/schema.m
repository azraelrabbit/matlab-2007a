function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pkg = findpackage('RptgenSL');
    pkgRG = findpackage('rptgen');
    % 12 13
    clsH = schema.class(pkg, 'WebViewExporter', pkgRG.findclass('DAObject'));
    % 14 17
    % 15 17
    % 16 17
    rptgen.prop(clsH, 'SearchScope', vertcat(cellhorzcat('Current', xlate('Current')), cellhorzcat('CurrentAndAbove', xlate('Current and above')), cellhorzcat('CurrentAndBelow', xlate('Current and below')), cellhorzcat('All', xlate('All'))), 'All', xlate('Include systems'));
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    rptgen.prop(clsH, 'StartPoint', 'handle', [], '', 2.0);
    % 27 30
    % 28 30
    % 29 30
    rptgen.prop(clsH, 'LookUnderMasks', vertcat(cellhorzcat('none', xlate('No masked blocks')), cellhorzcat('graphical', xlate('Masks with no workspace and no dialog')), cellhorzcat('functional', xlate('Masks with no dialog')), cellhorzcat('all', xlate('All masked blocks'))), 'graphical', xlate('Look under masks'));
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    rptgen.prop(clsH, 'FollowLinks', vertcat(cellhorzcat('on', xlate('Follow library links')), cellhorzcat('off', xlate('Do not follow library links'))), 'off', xlate('Follow library links'));
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    rptgen.prop(clsH, 'FollowModelReference', vertcat(cellhorzcat('on', xlate('Follow model reference blocks')), cellhorzcat('off', xlate('Do not follow model reference blocks'))), 'off', xlate('Follow model reference blocks'));
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    p = rptgen.prop(clsH, 'AdditonalArguments', 'MATLAB array', [], '');
    % 54 55
    p.Visible = 'off';
    % 56 59
    % 57 59
    % 58 59
    p = rptgen.prop(clsH, 'CacheFoundSys', 'MATLAB array', [], '');
    % 60 61
    p.Visible = 'off';
    % 62 64
    % 63 64
    rptgen.prop(clsH, 'FileName', 'String', '', xlate('Output file name'));
    % 65 69
    % 66 69
    % 67 69
    % 68 69
    rptgen.prop(clsH, 'ViewFile', 'bool', true, xlate('View file'));
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    rptgen.prop(clsH, 'CompressFile', 'bool', true, xlate('Compress image file'));
    % 75 78
    % 76 78
    % 77 78
    p = rptgen.prop(clsH, 'PackageFile', vertcat(cellhorzcat('none', xlate('Do not package file')), cellhorzcat('zip', xlate('Save as .zip'))), 'none', xlate('Package viewer into a single file'));
    % 79 83
    % 80 83
    % 81 83
    % 82 83
    p.Visible = 'off';
    % 84 94
    % 85 94
    % 86 94
    % 87 94
    % 88 94
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    % 93 94
    rptgen.prop(clsH, 'ExportedDirName', 'String', '', '', 2.0);
    % 95 99
    % 96 99
    % 97 99
    % 98 99
    rptgen.prop(clsH, 'ExportedGraphicFileName', 'String', '', '', 2.0);
    % 100 104
    % 101 104
    % 102 104
    % 103 104
    schema.method(clsH, 'export', 'static');
    schema.method(clsH, 'showDialog', 'static');
    schema.method(clsH, 'setDefault', 'static');
    schema.method(clsH, 'getStartPointAsHandle', 'static');
    % 108 109
    m = find(clsH.Method, 'Name', 'getDialogSchema');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle','string'};
        s.OutputTypes = {'mxArray'};
    end % if
    % 116 117
    m = find(clsH.Method, 'Name', 'updateErrorState');
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = {'handle'};
        s.OutputTypes = {};
    end % if
    % 124 127
    % 125 127
    % 126 127
    locSetSignature(clsH, 'areChildrenOrdered', {'handle'}, {'bool'});
    locSetSignature(clsH, 'isHierarchical', {'handle'}, {'bool'});
    locSetSignature(clsH, 'getChildren', {'handle'}, {'handle vector'});
    locSetSignature(clsH, 'getHierarchicalChildren', {'handle'}, {'handle vector'});
    locSetSignature(clsH, 'getDisplayLabel', {'handle'}, {'string'});
    locSetSignature(clsH, 'getDisplayIcon', {'handle'}, {'string'});
    locSetSignature(clsH, 'getPreferredProperties', {'handle'}, {'string vector'});
    locSetSignature(clsH, 'canAcceptDrop', {'handle','handle vector'}, {'bool'});
    locSetSignature(clsH, 'acceptDrop', {'handle','handle vector'}, {'bool'});
    locSetSignature(clsH, 'getContextMenu', {'handle','handle vector'}, {'handle'});
end % function
function locSetSignature(clsH, methodName, inputTypes, outputTypes)
    % 139 142
    % 140 142
    % 141 142
    m = find(clsH.Method, 'Name', methodName);
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = inputTypes;
        s.OutputTypes = outputTypes;
    end % if
end % function
