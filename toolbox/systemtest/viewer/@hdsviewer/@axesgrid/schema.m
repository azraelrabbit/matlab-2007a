function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('hdsviewer');
    % 10 12
    % 11 12
    supclass = findclass(findpackage('ctrluis'), 'axesgrid');
    % 13 15
    % 14 15
    c = schema.class(pkg, 'axesgrid', supclass);
    % 16 18
    % 17 18
    schema.prop(c, 'ZLabel', 'MATLAB array');
    schema.prop(c, 'ZLabelStyle', 'MATLAB array');
    % 20 22
    % 21 22
    schema.prop(c, 'Links', 'MATLAB array');
end % function
