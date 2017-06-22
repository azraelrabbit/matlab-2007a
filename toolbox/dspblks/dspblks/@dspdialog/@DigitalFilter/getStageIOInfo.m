function info = getStageIOInfo(this, action)
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
    info = cell(1.0, 2.0);
    switch action
    case 'MASK_NAMES'
        info{1.0} = 'stageInFracLength';
        info{2.0} = 'stageOutFracLength';
    case {'FL_SCHEMA','SL_SCHEMA'}
        % 23 24
        info{1.0}.Visible = 1.0;
        info{1.0}.Name = 'Input:';
        info{2.0}.Visible = 1.0;
        info{2.0}.Name = 'Output:';
    end % switch
end % function
