function [filerefs, filestates, uniquenames, istoolbox] = pResolveReferences(obj, locations, names, type)
    % 1 29
    % 2 29
    % 3 29
    % 4 29
    % 5 29
    % 6 29
    % 7 29
    % 8 29
    % 9 29
    % 10 29
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    [uniquenames, locations_to_files, orig_ind] = unique(names);
    % 29 32
    % 30 32
    uniquefiles = cell(size(uniquenames));
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    status = zeros(size(uniquenames));
    for i=1.0:numel(uniquenames)
        if eq(exist(uniquenames{i}, 'builtin'), 5.0)
            % 39 41
            status(i) = -1.0;
            continue;
        end % if
        uniquefiles{i} = which(uniquenames{i});
        if isempty(uniquefiles{i})
            % 45 49
            % 46 49
            % 47 49
            uniquefiles{i} = uniquenames{i};
            status(i) = -2.0;
        end % if
    end % for
    files = uniquefiles(orig_ind);
    % 53 67
    % 54 67
    % 55 67
    % 56 67
    % 57 67
    % 58 67
    % 59 67
    % 60 67
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    builtins = eq(status, -1.0);
    % 67 71
    % 68 71
    % 69 71
    missing = eq(status, -2.0);
    if obj.StoreReferences && any(missing)
        ind = ismember(orig_ind, find(missing));
        missing_names = names(ind);
        missing_locations = locations(ind);
        missing_files = unique(files(ind));
        unresolved = dependencies.FileReference.Alloc(numel(missing_names));
        for i=1.0:numel(missing_names)
            unresolved(i) = dependencies.FileReference.UnresolvedReference(missing_names{i}, type, missing_locations{i});
            % 79 81
        end % for
    else
        missing_files = {};
        unresolved = [];
    end % if
    % 85 87
    toremove = or(builtins, missing);
    if any(toremove)
        % 88 91
        % 89 91
        ind = ismember(orig_ind, find(toremove));
        names(ind) = [];
        locations(ind) = [];
        files(ind) = [];
        uniquefiles = uniquefiles(not(toremove));
        uniquenames = uniquenames(not(toremove));
    end % if
    % 97 100
    % 98 100
    [newuniquenames, locations_to_files, orig_ind] = unique(names);
    % 100 103
    % 101 103
    filestates = dependencies.FileState.Init(uniquefiles);
    % 103 105
    if obj.StoreReferences
        % 105 107
        filerefs = i_references(files, locations, type);
        % 107 110
        % 108 110
        istoolbox = false(size(filestates));
        for i=1.0:numel(filestates)
            refind = find(eq(orig_ind, i), 1.0, 'first');
            istoolbox(i) = not(isempty(filerefs(refind).Toolbox));
        end % for
        filerefs = vertcat(filerefs, unresolved);
    else
        % 116 120
        % 117 120
        % 118 120
        istoolbox = false(size(uniquefiles));
        for i=1.0:numel(uniquefiles)
            dirname = fileparts(uniquefiles{i});
            tb = dependencies.ToolboxDetails.IdentifyToolbox(dirname);
            istoolbox(i) = not(isempty(tb));
        end % for
        filerefs = [];
    end % if
    % 127 129
    if not(isempty(missing_files))
        % 129 131
        missing_files = dependencies.FileState.MissingFile(missing_files);
        filestates = vertcat(filestates, missing_files);
    end % if
function filerefs = i_references(files, locations, type)
    % 134 138
    % 135 138
    % 136 138
    filerefs = dependencies.FileReference.Alloc(numel(locations));
    for i=1.0:numel(filerefs)
        filerefs(i) = dependencies.FileReference(files{i}, type, locations{i});
        % 140 142
    end % for
