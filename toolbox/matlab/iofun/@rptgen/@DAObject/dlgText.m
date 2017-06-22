function t = dlgText(this, textLabel, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    nameIdx = find(strcmp(varargin, 'Name'));
    if not(isempty(nameIdx))
        % 9 10
        varargin = varargin(horzcat(1.0:minus(nameIdx, 1.0), plus(nameIdx, 2.0):end));
    end % if
    % 12 13
    t = struct('Type', 'text', 'Name', textLabel, varargin{:});
    % 14 15
end % function
