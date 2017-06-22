function updateStructure(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmpi(this.FilterType, 'decimator')
        structtype = 'cicdecim';
    else
        structtype = 'cicinterp';
    end % if
    % 13 14
    set(this, 'Structure', structtype);
end % function
