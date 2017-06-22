function AnalyzeFile(obj, filename)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if not(ischar(filename))
        error('Simulink:dependencies:FilenameNotString', 'filename must be a string');
    end % if
    % 13 15
    if obj.MTreeAvailable
        % 15 17
        tree = mtree(filename, '-file');
        obj.pAnalyze(tree, 'MFile', filename);
    end % if
    % 19 21
    obj.AnalyzedFiles = dependencies.cellcat(obj.AnalyzedFiles, cellhorzcat(filename));
    [ignore_path, name] = fileparts(filename);
    obj.UsedRefs = dependencies.cellcat(obj.UsedRefs, cellhorzcat(name));
    % 23 26
    % 24 26
    m = dependencies.compare_filenames(filename, obj.PendingFiles);
    if any(m)
        obj.PendingFiles = obj.PendingFiles(not(m));
        obj.PendingRefs = obj.PendingRefs(not(m));
    end % if
