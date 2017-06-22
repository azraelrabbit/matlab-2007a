function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('MPlay');
    inheritFromClass = findclass(package, 'DataLoadAbstract');
    thisclass = schema.class(package, 'DataLoadWorkspace', inheritFromClass);
    % 12 15
    % 13 15
    % 14 15
    if isempty(findtype('arrayFormatType'))
        schema.EnumType('arrayFormatType', {'array','struct'});
    end % if
    p = schema.prop(thisclass, 'arrayFormat', 'arrayFormatType');
    p.FactoryValue = 'array';
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    p = schema.prop(thisclass, 'getVideoFrameFcn', 'mxArray');
    p.FactoryValue = [];
end % function
