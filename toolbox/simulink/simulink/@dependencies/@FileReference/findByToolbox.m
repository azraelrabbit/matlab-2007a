function ind = findByToolbox(obj, toolboxname)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    thesetoolboxes = get(obj, 'Toolbox');
    if iscell(thesetoolboxes)
        thesenames = repmat({''}, size(thesetoolboxes));
        for i=1.0:numel(thesetoolboxes)
            if not(isempty(thesetoolboxes{i}))
                thesenames{i} = thesetoolboxes{i}.DirectoryName;
            end % if
        end % for
    end % if
    % 28 30
    % 29 30
    match = strcmp(thesenames, toolboxname);
    ind = find(match);
end % function
