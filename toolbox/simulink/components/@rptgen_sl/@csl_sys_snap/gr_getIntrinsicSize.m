function wh = gr_getIntrinsicSize(this, gm, varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if this.isPrintFrame && not(isempty(this.PrintFrameName))
        wh = [-1.0 -1.0];
    else
        % 21 23
        % 22 23
        wh = horzcat(minus(this.RuntimeBoundingBox(3.0), this.RuntimeBoundingBox(1.0)), minus(this.RuntimeBoundingBox(4.0), this.RuntimeBoundingBox(2.0)));
        % 24 25
        if not(strcmp(this.RuntimePaperOrientation, 'portrait'))
            wh = wh([2.0 1.0]);
        end % if
    end % if
end % function
