function icons = LoadIconFiles(varargin)
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
    if eq(nargin, 0.0)
        error('Must specify one or more icon files to load');
    end
    % 15 19
    % 16 19
    % 17 19
    icon_file_list = varargin;
    % 19 23
    % 20 23
    % 21 23
    if eq(nargin, 1.0) && iscell(icon_file_list{1.0})
        icon_file_list = icon_file_list{1.0};
    end
    % 25 27
    icons = [];
    for i=1.0:numel(icon_file_list)
        % 28 30
        if ~(ischar(icon_file_list{i}))
            error('Specified file name (#%d) is not a string', i);
        end
        % 32 35
        % 33 35
        full_path = which(icon_file_list{i}, '-all');
        new_icons = load(full_path{1.0});
        icons = mergefields(icons, new_icons);
    end % for
end
function z = mergefields(varargin)
    % 40 55
    % 41 55
    % 42 55
    % 43 55
    % 44 55
    % 45 55
    % 46 55
    % 47 55
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    z = varargin{1.0};
    for i=2.0:nargin
        f = fieldnames(varargin{i});
        for j=1.0:length(f)
            z.(f{j}) = varargin{i}.(f{j});
        end % for
    end % for
end
