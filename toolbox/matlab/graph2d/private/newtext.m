function varargout = newtext(varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    switch nargin
    case 0.0
        x = mean(get(gca, 'XLim'));
        y = mean(get(gca, 'YLim'));
        HG = text(x, y, 'text', 'EraseMode', 'normal', 'Editing', 'on');
        % 22 24
        % 23 24
        th = scribehandle(axistext(HG));
    case 1.0
        x = mean(get(gca, 'XLim'));
        y = mean(get(gca, 'YLim'));
        HG = text(x, y, varargin{:}, 'EraseMode', 'normal', 'Editing', 'on');
        % 29 31
        % 30 31
        th = scribehandle(axistext(HG));
    otherwise
        HG = text(varargin{:}, 'EraseMode', 'normal', 'Editing', 'on');
        % 34 36
        % 35 36
        th = scribehandle(axistext(HG));
        set(th, 'Prefix', {'set','EraseMode','xor'});
    end % switch
    % 39 41
    % 40 41
    set(get(get(HG, 'Parent'), 'Parent'), 'CurrentObject', HG);
    % 42 43
    waitfor(HG, 'Editing', 'off');
    % 44 45
    if any(ishandle(HG)) && isempty(deblank(get(HG, 'String')))
        delete(HG);
        HG = [];
    end % if
    % 49 50
    if eq(nargout, 1.0)
        if any(ishandle(HG))
            varargout{1.0} = th;
        else
            varargout{1.0} = [];
        end % if
    end % if
end % function
