function haveopengl = mech_opengl
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent HAVEOPENGL;
    % 8 10
    if isempty(HAVEOPENGL)
        % 10 14
        % 11 14
        % 12 14
        warnstate = warning;
        last = lastwarn;
        % 15 20
        % 16 20
        % 17 20
        % 18 20
        warning('off');
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        [dummy, HAVEOPENGL] = evalc('opengl(''info'')');
        % 25 30
        % 26 30
        % 27 30
        % 28 30
        lastwarn(last);
        warning(warnstate);
    end
    % 32 34
    haveopengl = HAVEOPENGL;
end
