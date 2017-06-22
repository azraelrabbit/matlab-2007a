function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('uimgr');
    inh = findclass(pkg, 'uigroup');
    schema.class(pkg, 'uistatusgroup', inh);
end % function
