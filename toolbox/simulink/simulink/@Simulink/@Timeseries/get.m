function out = get(h, varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    try
        if gt(nargin, 1.0)
            % 7 8
            out = eval(horzcat('h.', varargin{1.0}));
        else
            out = struct('Name', cellhorzcat(h.Name), 'BlockPath', cellhorzcat(h.BlockPath), 'PortIndex', cellhorzcat(h.PortIndex), 'SignalName', cellhorzcat(h.signalname), 'ParentName', cellhorzcat(h.parentname), 'TimeInfo', cellhorzcat(h.TimeInfo), 'Time', cellhorzcat(h.Time), 'Data', cellhorzcat(h.Data));
            % 11 18
            % 12 18
            % 13 18
            % 14 18
            % 15 18
            % 16 18
            % 17 18
        end % if
    catch
        disp('Error in Simulink.Timeseries::get.m');
        lasterr
    end % try
end % function
