function info = getAccumPrecInfo(this, action)
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
    [UTU, WTU] = deal(1.0, 2.0);
    info = cell(1.0, 2.0);
    switch action
    case 'MASK_NAMES'
        % 20 22
        info{UTU} = 'accumFracLength';
        info{WTU} = 'accum2FracLength';
    case {'FL_SCHEMA','SL_SCHEMA'}
        % 24 26
        info{WTU}.Visible = 1.0;
        if strcmp(this.Algo, 'Normalized LMS')
            info{UTU}.Visible = 1.0;
        else
            info{UTU}.Visible = 0.0;
        end % if
        % 31 33
        info{UTU}.Name = 'u''u:';
        info{WTU}.Name = 'W''u:';
    end % switch
