function thisunrender(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    delete(handles2vector(this));
    % 9 10
    if not(isempty(this.Container)) && ishandle(this.Container)
        delete(this.Container);
    end % if
end % function
