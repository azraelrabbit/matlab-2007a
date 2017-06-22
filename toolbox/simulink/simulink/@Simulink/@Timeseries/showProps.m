function out = showProps(h, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if gt(nargin, 1.0)
        prop = varargin{1.0};
        out = h.prop;
    else
        if not(isempty(h.findvar('Data'))) && not(isempty(h.findvar('Time')))
            out = struct('Name', cellhorzcat(h.Name), 'BlockPath', cellhorzcat(h.BlockPath), 'PortIndex', cellhorzcat(h.PortIndex), 'SignalName', cellhorzcat(h.signalname), 'ParentName', cellhorzcat(h.parentname), 'events', cellhorzcat(h.events), 'timeInfo', cellhorzcat(h.TimeInfo), 'Time', cellhorzcat(h.Time), 'Data', cellhorzcat(h.Data));
        else
            % 13 14
            % 14 15
            out = struct('Name', cellhorzcat(h.Name), 'BlockPath', cellhorzcat(h.BlockPath), 'PortIndex', cellhorzcat(h.PortIndex), 'SignalName', cellhorzcat(h.signalname), 'ParentName', cellhorzcat(h.parentname), 'events', cellhorzcat(h.events), 'timeInfo', cellhorzcat(h.TimeInfo));
            % 16 17
        end % if
    end % if
end % function
