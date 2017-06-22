function locked = drive_islocked(obj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 9 11
    root = bdroot(obj);
    % 11 13
    locked = ne(drive_getlibraryblock(obj), -1.0) || (strcmp(get_param(root, 'BlockDiagramType'), 'library') && strcmp(get_param(root, 'Lock'), 'on'));
    % 13 15
end
