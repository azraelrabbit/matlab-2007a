function ne_readinfofile(fileName, info)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    readf = pm_private('pm_readconfigfile');
    infoS = readf(fileName);
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    reader = struct('char', @lReadChar, 'logical', @lReadLogical, 'cell', @lReadStringArray);
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    subs = ne_infofilesubs;
    substrs = fieldnames(subs);
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    params = intersect(fieldnames(infoS), fieldnames(info));
    for i=1.0:length(params)
        param = params{i};
        valueStr = infoS.(param);
        for j=1.0:length(substrs)
            valueStr = strrep(valueStr, horzcat('$', substrs{j}), subs.(substrs{j}));
            % 37 39
        end % for
        % 39 41
        info.(param) = reader.(class(info.(param)))(valueStr);
    end % for
end
function val = lReadChar(str)
    % 44 46
    val = str;
end
function val = lReadLogical(str)
    % 48 50
    val = strcmp(str, 'true');
end
function val = lReadStringArray(str)
    % 52 54
    val = strread(str, '%s', 'delimiter', ',');
end
