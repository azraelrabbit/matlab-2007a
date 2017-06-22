function depsetdiffs = Diff(depset1, depset2, manifest1, manifest2)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    depsetdiffs = dependencies.DepSetDiffs;
    % 16 17
    depsetdiffs.DepSet1 = depset1;
    depsetdiffs.DepSet2 = depset2;
    % 19 22
    % 20 22
    % 21 22
    files1 = depset1.getAllFiles;
    files2 = depset2.getAllFiles;
    % 24 25
    one_only = false(size(files1));
    for i=1.0:numel(files1)
        one_only(i) = isempty(files2.find(files1(i).FileName));
    end % for
    depsetdiffs.FilesInFirstOnly = files1(one_only);
    % 30 31
    remainder1 = files1(not(one_only));
    % 32 33
    two_only = false(size(files2));
    for i=1.0:numel(files2)
        two_only(i) = isempty(files1.find(files2(i).FileName));
    end % for
    depsetdiffs.FilesInSecondOnly = files2(two_only);
    % 38 39
    remainder2 = files2(not(two_only));
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    remainder1 = unique(remainder1);
    remainder2 = unique(remainder2);
    % 46 47
    dependencies.assert(eq(numel(remainder1), numel(remainder2)), 'Same number of entries in each array');
    % 48 50
    % 49 50
    modified = false(size(remainder1));
    for i=1.0:numel(remainder1)
        modified(i) = not(remainder1(i).isequal(remainder2(i)));
    end % for
    % 54 55
    depsetdiffs.ModifiedFilesFirst = remainder1(modified);
    depsetdiffs.ModifiedFilesSecond = remainder2(modified);
    depsetdiffs.UnmodifiedFiles = remainder1(not(modified));
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    dirs1 = depset1.getAllDirs;
    dirs2 = depset2.getAllDirs;
    % 65 66
    if isempty(dirs2)
        one_only = true(size(dirs1));
    else
        one_only = false(size(dirs1));
        for i=1.0:numel(dirs1)
            one_only(i) = not(any(dependencies.compare_filenames(dirs1{i}, dirs2)));
        end % for
    end % if
    depsetdiffs.DirsInFirstOnly = dirs1(one_only);
    remainder1 = dirs1(not(one_only));
    % 76 77
    if isempty(dirs1)
        two_only = true(size(dirs2));
    else
        two_only = false(size(dirs2));
        for i=1.0:numel(dirs2)
            two_only(i) = not(any(dependencies.compare_filenames(dirs2{i}, dirs1)));
        end % for
    end % if
    depsetdiffs.DirsInSecondOnly = dirs2(two_only);
    remainder2 = dirs2(not(two_only));
    % 87 88
    dependencies.assert(eq(numel(remainder1), numel(remainder2)), 'Same number of entries in each array');
    % 89 91
    % 90 91
    depsetdiffs.DirsInBoth = unique(remainder1);
    % 92 93
    if gt(nargin, 2.0) && not(isempty(manifest1))
        depsetdiffs.Manifest1 = manifest1;
    end % if
    if gt(nargin, 3.0) && not(isempty(manifest2))
        depsetdiffs.Manifest2 = manifest2;
    end % if
    % 99 100
    depsetdiffs.SetReady;
    % 101 102
end % function
