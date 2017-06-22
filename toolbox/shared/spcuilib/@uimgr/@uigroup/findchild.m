function hChild = findchild(hParent, varargin)
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
    hChild = [];
    % 22 25
    % 23 25
    N = numel(varargin);
    if eq(N, 0.0)
        error('uimgr:NameNotSpecified', 'Name must be specified.');
    else
        if eq(N, 1.0)
            % 29 33
            % 30 33
            % 31 33
            NameList = varargin{1.0};
            if not(iscell(NameList))
                % 34 51
                % 35 51
                % 36 51
                % 37 51
                % 38 51
                % 39 51
                % 40 51
                % 41 51
                % 42 51
                % 43 51
                % 44 51
                % 45 51
                % 46 51
                % 47 51
                % 48 51
                % 49 51
                r = textscan(NameList, '%s', 'delimiter', '/');
                NameList = r{1.0};
                if gt(numel(NameList), 1.0)
                    NameList(1.0) = [];
                    % 54 57
                    % 55 57
                end % if
            end % if
        else
            % 59 61
            NameList = varargin;
            % 61 65
            % 62 65
            % 63 65
        end % if
        % 65 67
    end % if
    for i=1.0:numel(NameList)
        if not(ischar(NameList{i}))
            error('uimgr:NameMustBeString', 'Names must be specified using strings.');
        end % if
        hChild = hParent.find('-depth', 1.0, 'Name', NameList{i});
        % 72 76
        % 73 76
        % 74 76
        hChild = hChild(ne(hChild, hParent));
        if isempty(hChild)
            break
        end % if
        % 79 81
        hParent = hChild;
    end % for
end % function
