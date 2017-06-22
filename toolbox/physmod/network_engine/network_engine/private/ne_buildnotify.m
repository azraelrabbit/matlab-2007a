function ne_buildnotify(obj)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    persistent FUNCTIONS;
    mlock;
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    if isempty(FUNCTIONS)
        FUNCTIONS = {};
    end
    % 23 25
    if isempty(obj)
        % 25 29
        % 26 29
        % 27 29
        FUNCTIONS = {};
    else
        switch class(obj)
        case 'function_handle'
            % 32 37
            % 33 37
            % 34 37
            % 35 37
            FUNCTIONS{plus(end, 1.0)} = obj;
        case 'NetworkEngine.Library'
            % 38 43
            % 39 43
            % 40 43
            % 41 43
            for i=1.0:length(FUNCTIONS)
                fcn = FUNCTIONS{i};
                fcn(obj);
            end % for
            % 46 49
            % 47 49
        end
    end
    % 50 52
end
