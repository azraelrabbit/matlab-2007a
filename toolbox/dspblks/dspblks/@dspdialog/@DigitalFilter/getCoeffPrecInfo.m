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
    info = cell(1.0, 3.0);
    switch action
    case 'MASK_NAMES'
        info{1.0} = 'firstCoeffFracLength';
        info{2.0} = 'secondCoeffFracLength';
        info{3.0} = 'scaleValueFracLength';
    case {'FL_SCHEMA','SL_SCHEMA'}
        % 23 25
        info{1.0}.Visible = 1.0;
        info{2.0}.Name = 'Den:';
        info{3.0}.Name = 'Scale values:';
        if strcmp(this.DialogModeTransferFunction, 'IIR (poles & zeros)')
            info{1.0}.Name = 'Num:';
            info{2.0}.Visible = 1.0;
            if strncmp(this.DialogModeIIRStructure, 'Biquad direct', 13.0)
                info{3.0}.Visible = 1.0;
            else
                info{3.0}.Visible = 0.0;
            end % if
        else
            info{1.0}.Name = '';
            info{2.0}.Visible = 0.0;
            info{3.0}.Visible = 0.0;
        end % if
    end % switch
