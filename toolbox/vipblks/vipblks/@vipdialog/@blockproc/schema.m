function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    parentpackage = findpackage('dspdialog');
    parent = findclass(parentpackage, 'DSPDDG');
    % 10 11
    package = findpackage('vipdialog');
    hThisClass = schema.class(package, 'blockproc', parent);
    % 13 16
    % 14 16
    % 15 16
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 21 22
    m = schema.method(hThisClass, 'Opensubsystem');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 27 29
    % 28 29
    if isempty(findtype('VIPBlockprocTraverseEnum'))
        schema.EnumType('VIPBlockprocTraverseEnum', {'Row-wise','Column-wise'});
        % 31 32
    end % if
    % 33 34
    schema.prop(hThisClass, 'NumI', 'string');
    schema.prop(hThisClass, 'NumO', 'string');
    schema.prop(hThisClass, 'Blocksize', 'string');
    schema.prop(hThisClass, 'Overlapsize', 'string');
    schema.prop(hThisClass, 'Traverse', 'VIPBlockprocTraverseEnum');
end % function
