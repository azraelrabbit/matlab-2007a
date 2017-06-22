function out = get(h, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    if gt(nargin, 1.0)
        prop = varargin{1.0};
        out = h.(prop);
    else
        out = struct('Units', cellhorzcat(h.units), 'Start', cellhorzcat(h.start), 'End', cellhorzcat(h.end), 'Increment', cellhorzcat(h.increment), 'Length', cellhorzcat(h.Length), 'Framesize', cellhorzcat(h.Framesize), 'FrameStart', cellhorzcat(h.FrameStart), 'FrameEnd', cellhorzcat(h.FrameEnd), 'FrameIncrement', cellhorzcat(h.FrameIncrement));
        % 10 14
        % 11 14
        % 12 14
    end
end
