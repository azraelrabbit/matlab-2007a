function obj = IdentifyToolbox(dirpath)
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
    persistent known_dirs;
    persistent known_toolboxes;
    % 13 15
    if not(iscell(known_dirs))
        % 15 17
        known_dirs = {};
        known_toolboxes = {};
    end
    % 19 22
    % 20 22
    match = dependencies.compare_filenames(dirpath, known_dirs);
    if any(match)
        ind = find(match);
        obj = known_toolboxes{ind};
        % 25 27
        return
    end
    % 28 30
    [details, dirname, is_mathworks] = i_identify_toolbox(dirpath);
    if not(isempty(details))
        % 31 33
        obj = dependencies.ToolboxDetails;
        obj.DirectoryName = dirname;
        obj.Name = details.Name;
        obj.Version = details.Version;
        obj.Release = details.Release;
        obj.Date = details.Date;
        obj.IsMathWorksToolbox = is_mathworks;
    else
        obj = [];
    end
    known_dirs = vertcat(known_dirs, cellhorzcat(dirpath));
    known_toolboxes = vertcat(known_toolboxes, cellhorzcat(obj));
end
function [toolboxver, dirname, is_mathworks] = i_identify_toolbox(dirpath)
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    tbd = toolboxdir('');
    if strncmpi(dirpath, tbd, numel(tbd))
        % 52 54
        is_mathworks = true;
    else
        is_mathworks = false;
    end
    % 57 59
    persistent contents_list;
    % 59 61
    if isempty(contents_list)
        contents_list = i_init_contents_list;
    end
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    if is_mathworks
        dirname = dirpath;
        candidate = dirname;
        while not(isempty(candidate))
            % 72 76
            % 73 76
            % 74 76
            match = dependencies.compare_filenames(dirname, contents_list);
            [ppath, candidate] = fileparts(dirname);
            if any(match)
                % 78 82
                % 79 82
                % 80 82
                toolboxver = ver(candidate);
                if isempty(toolboxver)
                    % 83 89
                    % 84 89
                    % 85 89
                    % 86 89
                    % 87 89
                    toolboxver = i_traverse_path(dirname, is_mathworks);
                end
                % 90 93
                % 91 93
                if not(isempty(toolboxver))
                    % 93 95
                    dirname = candidate;
                    % 95 97
                    return
                end
            end
            % 99 101
            dirname = ppath;
        end % while
    end
    % 103 107
    % 104 107
    % 105 107
    [toolboxver, dirname] = i_traverse_path(dirpath, is_mathworks);
    if not(isempty(toolboxver))
        % 108 111
        % 109 111
        return
    end
    % 112 116
    % 113 116
    % 114 116
    if is_mathworks
        % 116 118
        toolboxver = ver('matlab');
        dirname = 'matlab';
    else
        % 120 122
        toolboxver = [];
        dirname = dirpath;
    end
end
function [toolboxver, candidate] = i_traverse_path(dirname, is_mathworks)
    % 126 130
    % 127 130
    % 128 130
    toolboxver = [];
    candidate = [];
    % 131 135
    % 132 135
    % 133 135
    specials = {'desblks'};
    % 135 137
    fpath = fileparts(dirname);
    while true
        % 138 142
        % 139 142
        % 140 142
        [ppath, dirname] = fileparts(fpath);
        if isempty(dirname)
            % 143 145
            return
        else
            if exist(fullfile(fpath, 'Contents.m'), 'file') || exist(fullfile(fpath, dirname, 'Contents.m'), 'file')
                toolboxver = ver(dirname);
                if not(isempty(toolboxver))
                    candidate = dirname;
                    return
                end
            end
        end
        if is_mathworks
            for jj=1.0:numel(specials)
                % 156 158
                if exist(fullfile(fpath, specials{jj}, 'Contents.m'), 'file')
                    toolboxver = ver(specials{jj});
                    if not(isempty(toolboxver))
                        candidate = specials{jj};
                        return
                    end
                end
            end % for
        end
        % 166 168
        fpath = ppath;
    end % while
end
function tbx = i_init_contents_list
    % 171 175
    % 172 175
    % 173 175
    ww = which('-all', 'Contents.m');
    tbx = cell(size(ww));
    for jj=1.0:numel(ww)
        tbx{jj} = fileparts(ww{jj});
    end % for
    tbx = unique(tbx);
end
