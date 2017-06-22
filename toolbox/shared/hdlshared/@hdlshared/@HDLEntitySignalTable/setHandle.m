function setHandle(this, indices, handle)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isscalar(indices)
        signal = this.Signals(indices);
        if eq(handle, -1.0)
            signal.Port = [];
        else
            signal.Port = get_param(handle, 'object');
        end % if
        % 14 16
        % 15 16
        this.PortHandles(indices) = handle;
    else
        % 18 19
        for n=1.0:length(indices)
            signal = this.Signals(indices(n));
            if eq(handle(n), -1.0)
                signal.Port = [];
            else
                signal.Port = get_param(handle(n), 'object');
            end % if
            % 26 28
            % 27 28
            this.PortHandles(indices(n)) = handle(n);
            % 29 30
        end % for
    end % if
end % function
