function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('rptgen');
    % 9 10
    clsH = schema.class(pkg, 'rptcomponent', pkg.findclass('DAObject'));
    % 11 14
    % 12 14
    % 13 14
    p = rptgen.prop(clsH, 'Active', 'bool', true, xlate('Run component'));
    % 15 16
    p.Visible = 'off';
    % 17 18
    rptgen.makeStaticMethods(clsH, {}, {'addComponent';'checkComponentTree';'findDisplayName';'getChildContentTypes';'getNumChildren';'help';'init';'runChildren';'runComponent';'save';'status';'moveLeft';'moveRight';'areChildrenOrdered';'isHierarchical';'getChildren';'getHierarchicalChildren';'getDisplayLabel';'getDisplayIcon';'view';'getPreferredProperties';'isCopyable';'isDeletable';'mcodeConstructor'});
    % 19 47
    % 20 47
    % 21 47
    % 22 47
    % 23 47
    % 24 47
    % 25 47
    % 26 47
    % 27 47
    % 28 47
    % 29 47
    % 30 47
    % 31 47
    % 32 47
    % 33 47
    % 34 47
    % 35 47
    % 36 47
    % 37 47
    % 38 47
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
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
    locSetSignature(clsH, 'view', {'handle'}, {});
    % 58 59
    locSetSignature(clsH, 'updateErrorState', {'handle'}, {});
    locSetSignature(clsH, 'doDelete', {'handle'}, {'bool'});
    locSetSignature(clsH, 'getDialogProxy', {'handle'}, {'handle'});
end % function
function locSetSignature(clsH, methodName, inputTypes, outputTypes)
    % 64 75
    % 65 75
    % 66 75
    % 67 75
    % 68 75
    % 69 75
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    % 74 75
    m = find(clsH.Method, 'Name', methodName);
    if not(isempty(m))
        s = m.Signature;
        s.varargin = 'off';
        s.InputTypes = inputTypes;
        s.OutputTypes = outputTypes;
    end % if
end % function
