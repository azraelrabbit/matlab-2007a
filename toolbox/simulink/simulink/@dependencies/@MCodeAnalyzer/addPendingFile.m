function addPendingFile(obj, filename)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    filename = cellstr(filename);
    refs = cell(size(filename));
    for i=1.0:numel(filename)
        [ignore_path, refs{i}] = fileparts(filename{i});
    end % for
    skip = false(size(filename));
    % 23 25
    if not(obj.AnalyzeMathWorksFiles) || not(obj.AnalyzeUserToolboxFiles)
        % 25 28
        % 26 28
        for i=1.0:numel(filename)
            tbd = dependencies.ToolboxDetails.IdentifyToolbox(filename{i});
            if not(isempty(tbd))
                skip(i) = (tbd.IsMathWorksToolbox && not(obj.AnalyzeMathWorksFiles)) || (not(tbd.IsMathWorksToolbox) && not(obj.AnalyzeUserToolboxFiles));
                % 31 33
            end
        end % for
    end
    % 35 37
    if any(skip)
        obj.SkippedFiles = unique(dependencies.cellcat(obj.SkippedFiles, filename(skip)));
    end
    % 39 41
    if any(not(skip))
        % 41 43
        [obj.PendingFiles, ind] = unique(dependencies.cellcat(obj.PendingFiles, filename(not(skip))));
        obj.PendingRefs = dependencies.cellcat(obj.PendingRefs, refs(not(skip)));
        obj.PendingRefs = obj.PendingRefs(ind);
    end
end
