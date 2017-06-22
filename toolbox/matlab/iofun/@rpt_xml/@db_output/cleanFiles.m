function cleanFiles(this, tempFilesDir)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    theFormat = this.getFormat;
    if theFormat.getCleanFiles && exist(tempFilesDir, 'dir')
        % 8 14
        % 9 14
        % 10 14
        % 11 14
        % 12 14
        preserveFiles = vertcat(dir(fullfile(tempFilesDir, '*.xfrag')), dir(fullfile(tempFilesDir, '*.rtf')), dir(fullfile(tempFilesDir, '*.doc')), dir(fullfile(tempFilesDir, '*.htm*')));
        % 14 21
        % 15 21
        % 16 21
        % 17 21
        % 18 21
        % 19 21
        if isempty(preserveFiles)
            [rmSuccess, rmMessage, rmMessageID] = rmdir(tempFilesDir, 's');
            if not(rmSuccess)
                rptgen.displayMessage(lasterr, 2.0);
            end % if
        else
            % 26 28
            allFiles = dir(tempFilesDir);
            allFiles = cellhorzcat(allFiles.name);
            preserveFiles = cellhorzcat(preserveFiles.name, '.', '..');
            delFiles = setdiff(allFiles, preserveFiles);
            for i=1.0:length(delFiles)
                try
                    delete(fullfile(tempFilesDir, delFiles{i}));
                catch
                    rptgen.displayMessage(sprintf('Unable to delete file "%s"', delFiles{i}), 2.0);
                    rptgen.displayMessage(lasterr, 5.0);
                end % try
            end % for
        end % if
    end % if
