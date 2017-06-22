function info = getCoeffPrecInfo(this, action)
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
    info = cell(1.0, 2.0);
    switch action
    case 'MASK_NAMES'
        % 19 21
        info{1.0} = 'firstCoeffFracLength';
        info{2.0} = 'secondCoeffFracLength';
    case {'FL_SCHEMA','SL_SCHEMA'}
        % 23 25
        if strcmp(this.stepflag, 'Dialog')
            info{1.0}.Visible = 1.0;
        else
            info{1.0}.Visible = 0.0;
        end % if
        % 29 31
        info{2.0}.Visible = 1.0;
        % 31 33
        info{1.0}.Name = 'Step size:';
        info{2.0}.Name = 'Leakage:';
    end % switch
