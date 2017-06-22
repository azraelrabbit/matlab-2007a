function delfilter(this, filter)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    for k=1.0:length(filter)
        filter(k).delCallbacks;
        % 10 11
        this.jHandle.removeFilter(filter(k).jhandle);
        % 12 13
        this.filters(eq(this.filters, filter(k))) = [];
    end % for
    % 15 16
    this.getfilteredgridindex([], []);
end % function
