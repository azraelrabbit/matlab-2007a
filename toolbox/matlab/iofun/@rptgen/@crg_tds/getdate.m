function dStr = getdate(c, d)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        d = clock;
    end % if
    % 9 12
    % 10 12
    switch c.datesep
    case 'SPACE'
        dSep = ' ';
    case 'NONE'
        dSep = '';
    otherwise
        dSep = c.datesep;
    end % switch
    % 19 21
    dStr = '';
    % 21 23
    for i=1.0:length(c.dateorder)
        if eq(i, length(c.dateorder))
            dSep = '';
        end % if
        % 26 28
        switch lower(c.dateorder(i))
        case 'd'
            dStr = sprintf('%s%i%s', dStr, d(3.0), dSep);
            % 31 34
            % 32 34
        case 'm'
            % 33 35
            switch lower(c.datemonth)
            case 'long'
                monthlong = {'January';'February';'March';'April';'May';'June';'July';'August';'September';'October';'November';'December'};
                % 37 50
                % 38 50
                % 39 50
                % 40 50
                % 41 50
                % 42 50
                % 43 50
                % 44 50
                % 45 50
                % 46 50
                % 47 50
                % 48 50
                dStr = sprintf('%s%s%s', dStr, monthlong{d(2.0)}, dSep);
                % 51 55
                % 52 55
                % 53 55
            case 'short'
                % 54 56
                monthshort = {'Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'};
                % 56 68
                % 57 68
                % 58 68
                % 59 68
                % 60 68
                % 61 68
                % 62 68
                % 63 68
                % 64 68
                % 65 68
                % 66 68
                dStr = sprintf('%s%s%s', dStr, monthshort{d(2.0)}, dSep);
            otherwise
                % 69 73
                % 70 73
                % 71 73
                % 72 74
                dStr = sprintf('%s%i%s', dStr, d(2.0), dSep);
                % 74 78
                % 75 78
                % 76 78
            end % switch
        case 'y'
            if strcmp(c.dateyear, 'SHORT')
                d(1.0) = minus(d(1.0), mtimes(floor(mrdivide(d(1.0), 100.0)), 100.0));
            end % if
            % 82 84
            dStr = sprintf('%s%0.2i%s', dStr, d(1.0), dSep);
            % 84 88
            % 85 88
            % 86 88
        end % switch
    end % for
