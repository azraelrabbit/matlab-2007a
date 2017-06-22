function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('PMDialogs');
    hBaseObj = hCreateInPackage.findclass('PmCheckBox');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'DynCheckBox', hBaseObj);
    % 14 16
    % 15 16
    schema.prop(hThisClass, 'ResolveBuddyTags', 'bool');
    schema.prop(hThisClass, 'MyTag', 'string');
    schema.prop(hThisClass, 'BuddyItemsTags', 'string vector');
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
    % 28 30
    % 29 30
    m = schema.method(hThisClass, 'OnChkBoxChange');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','mxArray','string'};
    s.OutputTypes = {};
end % function
