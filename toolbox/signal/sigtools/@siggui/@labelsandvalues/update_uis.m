function update_uis(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    visstate = get(this, 'visible');
    % 10 13
    % 11 13
    % 12 13
    h = get(this, 'handles');
    % 14 16
    % 15 16
    labels = get(this, 'labels');
    values = get(this, 'values');
    % 18 20
    % 19 20
    set(h.labels(union(this.hiddenlabels, plus(length(labels), 1.0):this.Maximum)), 'visible', 'off')
    % 21 22
    set(h.values(union(this.hiddenvalues, plus(length(values), 1.0):this.Maximum)), 'visible', 'off')
    % 23 25
    % 24 25
    for i=1.0:length(values)
        if not(any(eq(i, this.hiddenvalues)))
            set(h.values(i), 'visible', visstate, 'string', values{i});
            % 28 30
            % 29 30
        end % if
    end % for
    % 32 33
    for i=1.0:length(labels)
        if not(any(eq(i, this.hiddenlabels)))
            set(h.labels(i), 'visible', visstate, 'string', labels{i});
            % 36 38
            % 37 38
        end % if
    end % for
end % function
