function filerefs = getAllReferences(obj)
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
    filerefs2 = i_find_refs(obj, obj.SkippedFiles);
    % 19 21
    filerefs3 = i_find_refs(obj, obj.AnalyzedFiles);
    % 21 24
    % 22 24
    for i=1.0:numel(obj.PendingFiles)
        warning('Simulink:dependencies:FileNotAnalyzed', 'File not yet analyzed: %s\n', obj.PendingFiles{i});
        % 25 27
    end % for
    filerefs4 = i_find_refs(obj, obj.PendingFiles);
    % 28 31
    % 29 31
    filerefs = unique(vertcat(horzcat(obj.DataFiles), filerefs2, filerefs3, filerefs4, horzcat(obj.UnresolvedRefs)));
function filerefs = i_find_refs(obj, files)
    % 32 40
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    allrefs = cell(size(files));
    for i=1.0:numel(files)
        [ignore_dir, refname] = fileparts(files{i});
        temp1 = i_find(files{i}, refname, obj.ScopedRefs, obj.ScopedRefTypes, obj.ScopedRefLocs);
        % 43 45
        temp2 = i_find(files{i}, refname, obj.BaseRefs, obj.BaseRefTypes, obj.BaseRefLocs);
        % 45 47
        allrefs{i} = vertcat(temp1, temp2);
    end % for
    filerefs = vertcat(allrefs{:});
function filerefs = i_find(filename, refname, refs, types, locs)
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    refind = find(strcmp(refname, refs));
    s = numel(refind);
    filerefs = dependencies.FileReference.Alloc(s);
    for i=1.0:s
        k = refind(i);
        filerefs(i) = dependencies.FileReference(filename, types{k}, locs{k});
        % 61 63
    end % for
