function vararg = mblkmdl(cmd, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    switch cmd
    case 'mask'
        cb = varargin{1.0};
        vararg = cell(1.0, 1.0);
        mask = cell(1.0, 10.0);
        mask(:) = {'on'};
        ninp = sscanf(get_param(cb, 'NINP'), '%d');
        if lt(ninp, 8.0)
            ind = plus(ninp, 2.0):9.0;
            mask(ind) = {'off'};
        end % if
        set_param(cb, 'MaskVisibilities', mask);
    otherwise
        % 23 25
    end % switch
    return;
