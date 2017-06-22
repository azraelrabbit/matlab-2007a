function obj = MissingFile(name)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    name = cellstr(name);
    obj = dependencies.FileState.Alloc(numel(name));
    lastmod = dependencies.FileState.FileNotFound();
    for i=1.0:numel(obj)
        f = dependencies.FileState;
        f.FileName = name{i};
        f.Size = 0.0;
        f.LastModifiedDate = lastmod;
        obj(i) = f;
    end % for
