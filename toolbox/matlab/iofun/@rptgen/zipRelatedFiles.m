function zipFile = zipRelatedFiles(fileRoot, varargin)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    allFiles = rptgen.listRelatedFiles(fileRoot);
    % 22 25
    % 23 25
    if isempty(allFiles)
        error(sprintf('Can not zip - no files related to "%s" found', fileRoot));
    end % if
    % 27 29
    [fDir, fFile, fExt] = fileparts(allFiles{1.0});
    zipFile = fullfile(fDir, horzcat(fFile, '.zip'));
    % 30 32
    allFiles = strrep(allFiles, horzcat(fDir, filesep), '');
    % 32 34
    for i=1.0:length(varargin)
        fullName = fullfile(fDir, varargin{i});
        if exist(fullName, 'file')
            allFiles{plus(end, 1.0)} = varargin{i};
        else
            warning('rptgen:zip:NoFileFound', 'File "%s" does not exist. Additional files must be specified relative to the zipped report.', fullName);
            % 39 41
        end % if
    end % for
    % 42 44
    zip(zipFile, allFiles, fDir);
