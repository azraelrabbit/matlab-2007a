function simUtil_setPosition(block, xy, increment, iterator)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    pos = get_param(block, 'Position');
    % 25 27
    if eq(nargin, 2.0)
        % 27 30
        % 28 30
        if iscell(xy)
            posrel = get_param(xy{1.0}, 'Position');
            xy = xy{2.0};
            xy = plus(xy, posrel(1.0:2.0));
        end % if
        pos = plus(horzcat(0.0, 0.0, minus(pos(3.0), pos(1.0)), minus(pos(4.0), pos(2.0))), horzcat(xy(1.0), xy(2.0), xy(1.0), xy(2.0)));
        set_param(block, 'Position', pos);
    else
        if eq(nargin, 4.0)
            % 38 41
            % 39 41
            if iscell(xy)
                posrel = get_param(xy{1.0}, 'Position');
                xy = xy{2.0};
                xy = plus(xy, posrel(1.0:2.0));
            end % if
            xy = plus(xy, mtimes(increment, iterator));
            pos = plus(horzcat(0.0, 0.0, minus(pos(3.0), pos(1.0)), minus(pos(4.0), pos(2.0))), horzcat(xy(1.0), xy(2.0), xy(1.0), xy(2.0)));
            set_param(block, 'Position', pos);
        else
            error('Wrong number of arguments');
        end % if
    end % if
end % function
