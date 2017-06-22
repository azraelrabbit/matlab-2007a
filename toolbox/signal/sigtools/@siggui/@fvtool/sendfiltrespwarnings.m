function sendfiltrespwarnings(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    frw = get(this, 'FiltRespWarnings');
    for indx=1.0:length(frw)
        notification_listener(this, frw(indx), true);
    end % for
    set(this, 'FiltRespWarnings', []);
end % function
