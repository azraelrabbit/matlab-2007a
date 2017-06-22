function filename = getNextFileToAnalyze(obj)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if not(isempty(obj.PendingFiles))
        filename = obj.PendingFiles{1.0};
    else
        % 17 19
        % 18 19
        for i=1.0:numel(obj.ClassNames)
            % 20 21
            m = methods(obj.ClassNames{i});
            % 22 24
            % 23 24
            toanalyze = or(dependencies.cellmember(m, obj.ScopedRefs), dependencies.cellmember(m, obj.BaseRefs));
            % 25 26
            m = m(toanalyze);
            % 27 29
            % 28 29
            toanalyze = false(size(m));
            for k=1.0:numel(m)
                methodfile = which(horzcat(obj.ClassNames{i}, '/', m{k}));
                if not(isempty(methodfile)) && exist(methodfile, 'file')
                    match = dependencies.compare_filenames(methodfile, obj.AnalyzedFiles);
                    % 34 35
                    if not(any(match))
                        m{k} = methodfile;
                        toanalyze(k) = true;
                    end % if
                end % if
            end % for
            % 41 43
            % 42 43
            obj.addPendingFile(m(toanalyze));
        end % for
        % 45 46
        if not(isempty(obj.PendingFiles))
            filename = obj.PendingFiles{1.0};
        else
            filename = [];
        end % if
    end % if
end % function
