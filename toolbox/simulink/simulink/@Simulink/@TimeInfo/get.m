function out = get(h, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    if gt(nargin, 1.0)
        prop = varargin{1.0};
        out = h.(prop);
    else
        out = struct('Units', cellhorzcat(h.units), 'UserData', cellhorzcat(h.UserData), 'Start', cellhorzcat(h.start), 'End', cellhorzcat(h.end), 'Increment', cellhorzcat(h.increment), 'Length', cellhorzcat(h.Length));
        % 10 12
    end
end
