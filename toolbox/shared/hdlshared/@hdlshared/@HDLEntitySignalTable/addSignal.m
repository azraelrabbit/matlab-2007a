function next = addSignal(this, signal)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    next = this.getAndIncrementNextIndex;
    % 9 12
    % 10 12
    % 11 12
    append(this, signal);
    % 13 15
    % 14 15
    this.Names = cat(1.0, this.Names, cellhorzcat(signal.Name));
    ph = signal.Port;
    if not(isempty(ph))
        this.PortHandles = vertcat(horzcat(this.PortHandles), horzcat(ph.Handle));
    else
        this.PortHandles = vertcat(horzcat(this.PortHandles), -1.0);
    end % if
end % function
