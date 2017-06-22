function mergeConfigFiles(this, files, isDefault)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if ischar(files)
        files = cellhorzcat(files);
    end % if
    % 10 11
    for ii=1.0:length(files)
        if isDefault
            % 13 14
            curFile = files(ii);
            [dummy, filename] = fileparts(curFile.FileName);
        else
            curFile = files{ii};
            [dummy, filename] = fileparts(curFile);
        end % if
        % 20 21
        if isempty(strtrim(filename))
            continue;
        end % if
        % 24 25
        filename = horzcat(filename, '.m');
        fid = fopen(filename, 'r');
        if ne(fid, -1.0)
            % 28 29
            file = char(ctranspose(fread(fid)));
            fclose(fid);
            % 31 32
            idx = min(findstr(file, '='));
            % 33 34
            structname = deblank(file(9.0:minus(idx, 1.0)));
            structname = strtrim(structname);
            % 36 38
            % 37 38
            idx = findstr(file, char(10.0));
            if not(isempty(idx))
                file(1.0:idx(1.0)) = [];
            end % if
            try
                laste = lasterr;
                eval(file);
                cc = eval(structname);
                % 46 47
                this.MergedConfigContainer.merge(cc);
            catch
                if isDefault
                    lasterr(laste);
                else
                    % 52 54
                    % 53 54
                    % 54 55
                    warning(hdlcodererrormsgid('unabletoopenconfigfile'), 'Error processing control file %s--Attempting to continue without this file.', filename);
                    % 56 58
                    % 57 58
                end % if
            end % try
        else
            warning(hdlcodererrormsgid('unabletoopenconfigfile'), 'Cannot open control file %s--Attempting to continue without this file.', filename);
            % 62 64
            % 63 64
        end % if
    end % for
end % function
