function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('uimgr');
    inh = findclass(pkg, 'uibutton');
    schema.class(pkg, 'spctoggletool', inh);
end % function
