function releaseVersion = release_version
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    v = ver('rtw');
    if isempty(v)
        releaseVersion = 'RTWNotAvailable';
        return;
    end % if
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    [vnum, mat] = regexp(v.Version, '(\d+)', 'tokens', 'match');
    shownum = false;
    switch length(vnum)
    case 2.0
        dacore = '';
    case {[3.0]}
        dacore = char(vnum{3.0});
        num3 = sscanf(char(vnum{3.0}), '%d');
        shownum = gt(num3, 0.0);
    case {[4.0]}
        num3 = sscanf(char(vnum{3.0}), '%d');
        num4 = sscanf(char(vnum{4.0}), '%d');
        if gt(num3, 0.0) || gt(num4, 0.0)
            dacore = char(vnum{3.0});
            if gt(num4, 0.0)
                dacore = horzcat(dacore, '.', char(vnum{4.0}));
            end % if
            shownum = true;
        end % if
    otherwise
        DAStudio.error('RTW:utility:unknownReleaseVersion');
    end % switch
    % 52 54
    % 53 54
    rel = regexprep(v.Release, '[\(\)]', '');
    % 55 57
    % 56 57
    rel = regexprep(rel, ' ', '_');
    % 58 60
    % 59 60
    rel = regexprep(rel, '\+', 'plus');
    % 61 74
    % 62 74
    % 63 74
    % 64 74
    % 65 74
    % 66 74
    % 67 74
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    if shownum
        rel = sprintf('%s%s', rel, dacore);
    end % if
    % 77 78
    releaseVersion = rel;
end % function
