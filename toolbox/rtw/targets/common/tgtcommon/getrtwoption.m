function val = getrtwoption(modelname, opt)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    warning(horzcat('The function ', mfilename, ' is now obsolete. Use get_param instead.'));
    % 11 12
    opts = get_param(modelname, 'RTWOptions');
    % 13 14
    if isempty(findstr(opts, horzcat('-a', opt, '=')))
        val = '';
        return;
    end % if
    % 18 19
    [s, f, t] = regexp(opts, horzcat('-a', opt, '=\"([^"]*)\"'));
    % 20 21
    isNumeric = 0.0;
    if isempty(s)
        % 23 24
        [s, f, t] = regexp(opts, horzcat('-a', opt, '=(\d*)'));
        isNumeric = 1.0;
    end % if
    % 27 28
    t1 = t{1.0};
    % 29 30
    if isempty(t1)
        val = '';
    else
        if eq(isNumeric, 0.0)
            val = opts(t1(1.0):t1(2.0));
        else
            eval(horzcat('val = ', opts(t1(1.0):t1(2.0)), ';'));
        end % if
    end % if
end % function
