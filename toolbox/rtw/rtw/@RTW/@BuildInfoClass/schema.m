function schema
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    hCreateInPkg = findpackage('RTW');
    % 18 19
    hBaseClass = {};
    try
        % 21 22
        hBasePkg = findpackage('DAStudio');
        if not(isempty(hBasePkg))
            hBaseClass = cellhorzcat(hBasePkg.findclass('Object'));
        end % if
    catch
        % 27 28
        lasterr('');
    end % try
    % 30 32
    % 31 32
    hThisClass = schema.class(hCreateInPkg, 'BuildInfoClass', hBaseClass{:});
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    hThisProp = schema.prop(hThisClass, 'Settings', 'handle');
    hThisProp.FactoryValue = [];
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    hThisProp = schema.prop(hThisClass, 'DisplayLabel', 'string');
    hThisProp.FactoryValue = 'BuildInfoObject';
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    hThisProp = schema.prop(hThisClass, 'Group', 'string');
    hThisProp.FactoryValue = '';
    % 53 56
    % 54 56
    % 55 56
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 61 64
    % 62 64
    % 63 64
    m = schema.method(hThisClass, 'getBaseBuildInfoClassProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
end % function
