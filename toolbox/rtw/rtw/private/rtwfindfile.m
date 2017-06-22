function filelist = rtwfindfile(dirlist, extlist)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if not(iscell(dirlist))
        tmp = dirlist;
        clear('dirlist');
        dirlist{1.0} = tmp;
    end % if
    if not(iscell(extlist))
        tmp = extlist;
        clear('extlist');
        extlist{1.0} = tmp;
    end % if
    filelistall = findAllFilesInDir(dirlist);
    filelist = '';
    extlist = strcat('.', extlist);
    for j=1.0:length(extlist)
        extension = extlist{j};
        sizeOfExt = minus(length(extension), 1.0);
        fileext = '';
        for i=1.0:length(filelistall)
            fileext{i} = filelistall{i}(minus(end, sizeOfExt):end);
        end % for
        hasExtension = strcmpi(fileext, extension);
        filelist = horzcat(filelist, filelistall(hasExtension));
        filelistall = filelistall(not(hasExtension));
    end % for
function filelist = findAllFilesInDir(dirlist)
    filelist = '';
    for i=1.0:length(dirlist)
        dirEntries = dir(dirlist{i});
        % 37 39
        subdirlist = cellhorzcat(dirEntries(find(horzcat(dirEntries.isdir))).name);
        subfilelist = cellhorzcat(dirEntries(find(eq(horzcat(dirEntries.isdir), 0.0))).name);
        % 40 42
        if not(isempty(subfilelist))
            filelist = horzcat(filelist, strcat(horzcat(dirlist{i}, filesep), subfilelist));
        end % if
        % 44 46
        subdirlist = subdirlist(not(or(strcmp('.', subdirlist), strcmp('..', subdirlist))));
        % 46 49
        % 47 49
        if not(isempty(subdirlist))
            directories = strcat(horzcat(dirlist{i}, filesep), subdirlist);
            filelist = horzcat(filelist, findAllFilesInDir(directories));
        end % if
    end % for
