function subsystems = getsys(c, type, startsys, showblocks)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    cstruc = struct(c);
    % 25 27
    if strcmp(startsys, 'CURRENT')
        startsys = gcs;
    else
        if strcmp(startsys, 'TOP')
            startsys = bdroot;
        end
    end
    if not(isempty(gcs))
        switch upper(type)
        case 'ALL'
            subsystems = locmakesyslist(c, bdroot, 'down', showblocks);
        case 'START'
            subsystems = locflesh(cellhorzcat(startsys));
        case 'STARTABOVE'
            subsystems = locmakesyslist(c, startsys, 'up', showblocks);
        case 'STARTBELOW'
            subsystems = locmakesyslist(c, startsys, 'down', showblocks);
        case 'CUSTOM'
            subsystems = locflesh(cstruc.att.customlist);
        end
    else
        subsystems = [];
    end
end
function list = locflesh(fullnames)
    % 51 55
    % 52 55
    % 53 55
    if gt(length(fullnames), 0.0)
        for i=1.0:length(fullnames)
            entry.fullname = fullnames{i};
            entry.depth = length(findstr('/', fullnames{i}));
            entry.blockname = locblockname(fullnames{i});
            entry.type = 's';
            entry = LocIndentName(entry);
            list(i) = entry;
        end % for
    else
        list = [];
    end
end
function entry = LocIndentName(entry)
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    nojunkname = strrep(entry.blockname, sprintf('\n'), ' ');
    entry.indentname = horzcat(char(mtimes(' ', ones(1.0, mtimes(4.0, entry.depth)))), nojunkname);
end
function list = locmakesyslist(c, startcomp, direction, showblocks)
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    entry.fullname = startcomp;
    entry.depth = length(findstr('/', startcomp));
    entry.blockname = locblockname(entry.fullname);
    entry.type = 's';
    entry = LocIndentName(entry);
    % 85 87
    list = loclist(entry, direction, showblocks);
end
function list = loclist(list, direction, showblocks)
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    index = length(list);
    % 94 96
    if strcmp(direction, 'up')
        parent = get_param(list(index).fullname, 'Parent');
        if isempty(parent)
            list = list;
        else
            entry.fullname = parent;
            entry.depth = minus(list(index).depth, 1.0);
            entry.blockname = locblockname(entry.fullname);
            entry.type = 's';
            entry = LocIndentName(entry);
            % 105 107
            list(plus(length(list), 1.0)) = entry;
            list = loclist(list, direction, showblocks);
        end
    else
        try
            blocks = get_param(list(index).fullname, 'Blocks');
        catch
            blocks = {};
        end % try
        % 115 117
        for i=1.0:length(blocks)
            % 117 119
            entry.fullname = horzcat(list(index).fullname, '/', blocks{i});
            entry.depth = plus(list(index).depth, 1.0);
            entry.blockname = locblockname(blocks{i});
            try
                % 122 124
                get_param(entry.fullname, 'Blocks');
                entry.type = 's';
                entry = LocIndentName(entry);
                list(plus(length(list), 1.0)) = entry;
                list = loclist(list, direction, showblocks);
            catch
                % 129 131
                if showblocks
                    entry.type = 'b';
                    entry = LocIndentName(entry);
                    list(plus(length(list), 1.0)) = entry;
                end
            end % try
        end % for
    end
end
function shortname = locblockname(longname)
    % 140 144
    % 141 144
    % 142 144
    slashes = findstr('/', longname);
    if isempty(slashes)
        shortname = longname;
    else
        lastslash = slashes(length(slashes));
        namelength = length(longname);
        shortname = longname(plus(lastslash, 1.0):namelength);
    end
    shortname = strrep(shortname, sprintf('\n'), ' ');
end
