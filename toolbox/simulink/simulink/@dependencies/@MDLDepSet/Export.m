function Export(obj, filename, type, root)
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
    to_zip = true;
    preserve_hierarchy = false;
    % 23 25
    if gt(nargin, 2.0)
        if not(ischar(filename))
            error('MATLAB:InvalidInput', 'Input argument "filename" must be a string');
        end
        switch lower(type)
        case 'zip'
            to_zip = true;
        case 'dir'
            to_zip = false;
            if not(exist(filename, 'dir'))
                error('Simulink:dependencies:UnknownDirectory', 'Directory "%s" does not exist', filename);
                % 35 37
            end
        otherwise
            error('Simulink:dependencies:UnknownExportType', 'Unknown export flag: %s', type);
            % 39 41
        end
    end
    % 42 44
    if gt(nargin, 3.0) && not(isempty(root))
        preserve_hierarchy = true;
        if not(ischar(root))
            error('MATLAB:InvalidInput', 'Input argument "root" must be a string');
        end
        if not(exist(root, 'dir'))
            error('Simulink:dependencies:UnknownRoot', 'The specified root directory "%s" does not exist', root);
            % 50 52
        end
    end
    % 53 55
    allfiles = getAllFiles(obj);
    if not(numel(allfiles))
        error('Simulink:dependencies:EmptyManifest', 'There are no files in this manifest to export');
        % 57 59
    end
    % 59 63
    % 60 63
    % 61 63
    if not(all(exist(allfiles)))
        % 63 65
        missingfiles = allfiles(not(exist(allfiles)));
        missinglist = dependencies.csl(get(missingfiles, 'FileName'));
        % 66 68
        error('Simulink:dependencies:MissingFilesInManifest', 'This model requires the following files, but they do not exist. Consider editing the manifest file.\n%s', missinglist);
        % 68 71
        % 69 71
    end
    % 71 75
    % 72 75
    % 73 75
    allfiles = cellstr(get(allfiles, 'FileName'));
    % 75 77
    if preserve_hierarchy
        i_export_hierarchical(to_zip, filename, root, allfiles);
    else
        i_export_flat(to_zip, filename, allfiles);
    end
end
function i_export_flat(to_zip, filename, allfiles)
    % 83 89
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    shortnames = allfiles;
    for i=1.0:numel(allfiles)
        [ignore_path, name, ext] = fileparts(shortnames{i});
        shortnames{i} = horzcat(name, ext);
    end % for
    [uniquenames, ind] = unique(shortnames);
    if lt(numel(uniquenames), numel(shortnames))
        % 95 97
        duplicate_ind = setdiff(1.0:numel(shortnames), ind);
        duplicate_names = unique(shortnames(duplicate_ind));
        msg = dependencies.csl(duplicate_names);
        msg = sprintf('Cannot export to a single directory because there are files in different directories which have the same name:\n%s', msg);
        % 100 102
        error('Simulink:dependencies:ExportDuplicateFiles', msg);
    end
    % 103 105
    if to_zip
        % 105 108
        % 106 108
        zip(filename, allfiles);
    else
        failures = {};
        for i=1.0:numel(allfiles)
            [ignorepath, name, ext] = fileparts(allfiles{i});
            newname = fullfile(filename, horzcat(name, ext));
            [success, msg] = copyfile(allfiles{i}, newname);
            if not(success)
                fprintf('Failed to copy file "%s": %s\n', allfiles{i}, msg);
                failures = vertcat(failures, allfiles(i));
            end
        end % for
        if not(isempty(failures))
            % 120 122
            error('Simulink:dependencies:CopyFailed', 'Could not copy all files');
        end
    end
end
function i_export_hierarchical(to_zip, filename, root, allfiles)
    % 126 130
    % 127 130
    % 128 130
    if ispc
        matchfn = @strncmpi;
    else
        matchfn = @strncmp;
    end
    % 134 136
    if ne(root(end), filesep)
        root(plus(end, 1.0)) = filesep;
    end
    % 138 140
    rootlen = numel(root);
    relpaths = allfiles;
    % 141 147
    % 142 147
    % 143 147
    % 144 147
    % 145 147
    hasexternal = false;
    % 147 149
    for i=1.0:numel(allfiles)
        thisfile = allfiles{i};
        if matchfn(thisfile, root, rootlen)
            % 151 153
            relpaths{i} = thisfile(plus(rootlen, 1.0):end);
        else
            % 154 157
            % 155 157
            [ignore_path, name, ext] = fileparts(thisfile);
            relpaths{i} = fullfile('external', horzcat(name, ext));
            hasexternal = true;
        end
    end % for
    % 161 164
    % 162 164
    if not(to_zip)
        exportdir = filename;
    else
        if hasexternal
            % 167 169
            exportdir = tempname;
            root = exportdir;
        else
            exportdir = [];
        end
    end
    if not(isempty(exportdir))
        % 175 177
        failures = {};
        for i=1.0:numel(relpaths)
            newname = fullfile(exportdir, relpaths{i});
            i_mkdir(fileparts(newname));
            [success, msg] = copyfile(allfiles{i}, newname);
            if not(success)
                fprintf('Failed to copy file "%s": %s\n', allfiles{i}, msg);
                failures = vertcat(failures, allfiles(i));
            end
        end % for
        if not(isempty(failures))
            % 187 189
            error('Simulink:dependencies:CopyFailed', 'Could not copy all files');
        end
    end
    % 191 193
    if to_zip
        % 193 196
        % 194 196
        zip(filename, relpaths, root);
        if not(isempty(exportdir))
            % 197 199
            [success, msg, id] = rmdir(exportdir, 's');
            if not(success)
                warning(id, msg);
            end
        end
    end
end
function i_mkdir(dirpath)
    % 206 227
    % 207 227
    % 208 227
    % 209 227
    % 210 227
    % 211 227
    % 212 227
    % 213 227
    % 214 227
    % 215 227
    % 216 227
    % 217 227
    % 218 227
    % 219 227
    % 220 227
    % 221 227
    % 222 227
    % 223 227
    % 224 227
    % 225 227
    if not(exist(dirpath, 'dir'))
        [parentdir, dirname] = fileparts(dirpath);
        if le(numel(dirpath), numel(parentdir))
            error('Simulink:dependencies:FailedToCreateDirectory', 'Could not create directory %s', dirpath);
        else
            if not(exist(parentdir, 'dir'))
                i_mkdir(parentdir);
            end
        end
        [success, msg, id] = mkdir(parentdir, dirname);
        if not(success)
            error(id, msg);
        end
    end
end
