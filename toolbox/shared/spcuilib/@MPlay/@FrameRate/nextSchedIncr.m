function nextIncr = nextSchedIncr(framerateObj)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    if eq(framerateObj.sched_showCount, 1.0)
        % 23 24
        nextIncr = plus(1.0, framerateObj.sched_skipCount);
    else
        % 26 27
        framerateObj.sched_counter = plus(1.0, framerateObj.sched_counter);
        % 28 29
        if eq(framerateObj.sched_counter, framerateObj.sched_showCount)
            % 30 31
            framerateObj.sched_counter = 0.0;
            nextIncr = plus(1.0, framerateObj.sched_skipCount);
        else
            % 34 35
            nextIncr = 1.0;
        end % if
    end % if
end % function
