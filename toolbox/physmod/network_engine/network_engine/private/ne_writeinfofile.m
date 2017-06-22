function ne_writeinfofile(fileName, info)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    fileDir = fileparts(fileName);
    if isempty(dir(fileDir))
        mkdir(fileDir);
    end
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    fid = fopen(fileName, 'w');
    if eq(fid, -1.0)
        pm_error('network_engine:ne_readinfofile:CannotWriteInfoFile', fileName);
    end
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    writer = struct('char', @l_WriteChar, 'logical', @l_WriteLogical, 'cell', @l_WriteStringArray);
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    props = fieldnames(info);
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    subs = ne_infofilesubs;
    substrs = fieldnames(subs);
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    fprintf(fid, '# automatically generated library item info\n');
    % 46 48
    for i=1.0:length(props)
        % 48 52
        % 49 52
        % 50 52
        val = info.(props{i});
        % 52 57
        % 53 57
        % 54 57
        % 55 57
        str = writer.(class(val))(val);
        % 57 62
        % 58 62
        % 59 62
        % 60 62
        for j=1.0:length(substrs)
            str = strrep(str, subs.(substrs{j}), horzcat('$', substrs{j}));
        end % for
        % 64 69
        % 65 69
        % 66 69
        % 67 69
        fprintf(fid, '%s=%s\n', props{i}, str);
    end % for
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    fclose(fid);
end
function str = l_WriteChar(val)
    % 77 79
    str = val;
end
function str = l_WriteLogical(val)
    % 81 83
    if val
        str = 'true';
    else
        str = 'false';
    end
end
function str = l_WriteStringArray(val)
    % 89 91
    if ~(isempty(val))
        str = horzcat(val{1.0}, sprintf(',%s', val{2.0:end}));
    else
        str = '';
    end
end
