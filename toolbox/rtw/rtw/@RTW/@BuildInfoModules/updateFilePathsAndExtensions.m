function updateFilePathsAndExtensions(h, varargin)
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
    % 11 12
    if lt(nargin, 2.0)
        extList = {'.c','.C'};
    else
        if iscell(varargin{1.0})
            extList = varargin{1.0};
        else
            extList = cellhorzcat(varargin{1.0});
        end % if
    end % if
    % 21 22
    fnames = get(h.Files, 'FileName');
    if isempty(fnames)
        fnames = {};
    else
        if not(iscell(fnames))
            fnames = cellhorzcat(fnames);
        end % if
    end % if
    % 30 31
    fpaths = get(h.Files, 'Path');
    if isempty(fpaths)
        fpaths = {};
    else
        if not(iscell(fpaths))
            fpaths = cellhorzcat(fpaths);
        end % if
    end % if
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    finalNames = fnames;
    finalPaths = fpaths;
    % 46 47
    paths = get(h.Paths, 'Value');
    if isempty(paths)
        paths = {};
    else
        if not(iscell(paths))
            paths = cellhorzcat(paths);
        end % if
    end % if
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    nomlr_paths = strrep(paths, '$(MATLAB_ROOT)', h.Settings.Matlabroot);
    nomlr_fpaths = strrep(fpaths, '$(MATLAB_ROOT)', h.Settings.Matlabroot);
    % 62 64
    % 63 64
    for i=1.0:length(paths)
        % 65 66
        dirFiles = dir(nomlr_paths{i});
        % 67 71
        % 68 71
        % 69 71
        % 70 71
        dirNames{i} = cellhorzcat(dirFiles(:).name);
        % 72 74
        % 73 74
        for j=1.0:length(extList)
            % 75 76
            fnamesExt = strcat(fnames, extList{j});
            % 77 78
            [tf, fIdx] = intersect(fnamesExt, dirNames{i});
            if not(isempty(tf))
                for k=1.0:length(fIdx)
                    if isempty(fpaths{fIdx(k)}) || eq(strcmp(fpaths{fIdx(k)}, paths{i}), 1.0)
                        % 82 83
                        finalNames{fIdx(k)} = fnamesExt{fIdx(k)};
                        finalPaths{fIdx(k)} = paths{i};
                        % 85 91
                        % 86 91
                        % 87 91
                        % 88 91
                        % 89 91
                        % 90 91
                        fnames{fIdx(k)} = '*.';
                        fpaths{fIdx(k)} = '*/';
                    end % if
                end % for
            end % if
        end % for
    end % for
    % 98 102
    % 99 102
    % 100 102
    % 101 102
    for i=1.0:length(fnames)
        if isempty(strfind(fnames{i}, '.'))
            for j=1.0:length(extList)
                fullname = horzcat(nomlr_fpaths{i}, filesep, fnames{i}, extList{j});
                if exist(fullname, 'file')
                    finalNames{i} = horzcat(fnames{i}, extList{j});
                    break
                end % if
            end % for
        end % if
    end % for
    % 113 117
    % 114 117
    % 115 117
    % 116 117
    emptyPathIdx = find(eq(strcmp(fpaths, ''), 1.0));
    if not(isempty(emptyPathIdx))
        sort(emptyPathIdx);
        for i=1.0:length(paths)
            % 121 122
            emptyPathFnames = fnames(emptyPathIdx);
            [tf, fIdx] = intersect(emptyPathFnames, dirNames{i});
            if not(isempty(tf))
                foundIdx = emptyPathIdx(fIdx);
                finalPaths(foundIdx) = cellhorzcat(paths{i});
                emptyPathIdx = setdiff(emptyPathIdx, foundIdx);
            end % if
        end % for
    end % if
    % 131 133
    % 132 133
    set(h.Files, {'FileName'}, finalNames);
    set(h.Files, {'Path'}, finalPaths);
end % function
