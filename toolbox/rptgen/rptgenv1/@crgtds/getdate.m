function datestr = getdate(c)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    monthlong = {'January';'February';'March';'April';'May';'June';'July';'August';'September';'October';'November';'December'};
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    monthshort = {'Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'};
    % 20 32
    % 21 32
    % 22 32
    % 23 32
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    d = clock;
    datestr = [];
    % 34 35
    for i=1.0:length(c.att.dateorder)
        switch lower(c.att.dateorder(i))
        case 'd'
            day = num2str(d(3.0));
            datestr = horzcat(datestr, day);
        case 'm'
            month = d(2.0);
            switch lower(c.att.datemonth)
            case 'long'
                month = monthlong{month};
            case 'short'
                month = monthshort{month};
            otherwise
                month = num2str(month);
            end % switch
            % 50 51
            datestr = horzcat(datestr, month);
        case 'y'
            year = d(1.0);
            switch c.att.dateyear
            case 'LONG'
                year = num2str(year);
            otherwise
                year = minus(year, mtimes(floor(mrdivide(year, 100.0)), 100.0));
                year = num2str(year);
            end % switch
            datestr = horzcat(datestr, year);
        end % switch
        % 63 64
        if ne(i, length(c.att.dateorder))
            datestr = horzcat(datestr, c.att.datesep);
        end % if
    end % for
end % function
