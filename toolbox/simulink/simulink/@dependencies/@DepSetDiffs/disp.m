function disp(obj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    fprintf('DepSetDiffs:\n');
    if not(isempty(obj.DepSet1))
        m1 = get(obj.DepSet1, 'MDLName');
        if iscell(m1)
            m1 = dependencies.csl(m1);
        end % if
        fprintf('  DepSet1: %s\n    Analyzed: %s\n', m1, obj.DepSet1(1.0).AnalysisDate);
    end % if
    % 14 15
    if not(isempty(obj.DepSet2))
        m2 = get(obj.DepSet2, 'MDLName');
        if iscell(m2)
            m2 = dependencies.csl(m2);
        end % if
        fprintf('  DepSet2: %s\n    Analyzed: %s\n', m2, obj.DepSet2(1.0).AnalysisDate);
    end % if
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    fprintf('  %d files in DepSet1 only, %d files in DepSet2 only\n', numel(obj.FilesInFirstOnly), numel(obj.FilesInSecondOnly));
    % 31 32
    fprintf('  %d modified files, %d unmodified files\n', numel(obj.ModifiedFilesFirst), numel(obj.UnmodifiedFiles));
end % function
