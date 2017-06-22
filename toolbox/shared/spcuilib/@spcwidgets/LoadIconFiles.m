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
        error('spcwidgets:IconNotSpecified', 'Must specify one or more icon files to load');
        % 14 16
    end
    % 16 20
    % 17 20
    % 18 20
    icon_file_list = varargin;
    % 20 24
    % 21 24
    % 22 24
    if eq(nargin, 1.0) && iscell(icon_file_list{1.0})
        icon_file_list = icon_file_list{1.0};
    end
    % 26 28
    icons = [];
    for i=1.0:numel(icon_file_list)
        % 29 31
        if ~(ischar(icon_file_list{i}))
            error('spcwidgets:NotAString', 'Specified file name (#%d) is not a string', i);
            % 32 34
        end
        % 34 37
        % 35 37
        full_path = which(icon_file_list{i}, '-all');
        new_icons = load(full_path{1.0});
        icons = mergefields(icons, new_icons);
    end % for
end
function z = mergefields(varargin)
    % 42 57
    % 43 57
    % 44 57
    % 45 57
    % 46 57
    % 47 57
    % 48 57
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    z = varargin{1.0};
    for i=2.0:nargin
        f = fieldnames(varargin{i});
        for j=1.0:length(f)
            z.(f{j}) = varargin{i}.(f{j});
        end % for
    end % for
end
