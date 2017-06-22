function msg = drive_engineerror(blk, id)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    slerr = sllasterror;
    txt = slerr.Message;
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    txts = strread(txt, '%s', 'delimiter', '\n', 'whitespace', '');
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    txts = regexprep(txts, '^Error reported by.*$', '');
    txts = regexprep(txts, '^Error occurred in.*$', '');
    txts = regexprep(txts, '^Error using.*$', '');
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    empty = false(length(txts));
    for i=1.0:length(txts)
        empty(i) = isempty(txts{i});
    end % for
    txts(empty) = [];
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    msgs = repmat({''}, minus(mtimes(2.0, length(txts)), 1.0), 1.0);
    msgs(1.0:2.0:end) = txts;
    msgs(2.0:2.0:end) = cellhorzcat(sprintf('\n'));
    msg = horzcat(msgs{:});
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    root = bdroot(blk);
    blocks = find_system(root, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'RegExp', 'on', 'ReferenceBlock', horzcat('^', drivelib));
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    sources = getfullname(blocks);
    len = zeros(length(sources), 1.0);
    for i=1.0:length(sources)
        len(i) = length(sources{i});
    end % for
    [dummy, idx] = sort(len);
    idx = idx(end:-1.0:1.0);
    sources = sources(idx);
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    % 70 71
    z = char(0.0);
    for i=1.0:length(sources)
        msg = strrep(msg, sources{i}, horzcat(z, num2str(i), z));
    end % for
    for i=1.0:length(sources)
        sname = horzcat('''', drive_sanitizeblockname(sources{i}), '''');
        msg = strrep(msg, horzcat(z, num2str(i), z), sname);
    end % for
    % 79 81
    % 80 81
    msg = regexprep(msg, '''+', '''');
end % function
