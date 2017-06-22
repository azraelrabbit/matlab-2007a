function info = getProdPrecInfo(this, action)
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
    [UTU, WTU, MUE, QU, QUOT] = deal(1.0, 2.0, 3.0, 4.0, 5.0);
    info = cell(1.0, 5.0);
    switch action
    case 'MASK_NAMES'
        % 21 22
        info{UTU} = 'prodOutputFracLength';
        info{WTU} = 'prodOutput2FracLength';
        info{MUE} = 'prodOutput3FracLength';
        info{QU} = 'prodOutput4FracLength';
        info{QUOT} = 'quotientFracLength';
    case {'FL_SCHEMA','SL_SCHEMA'}
        % 28 29
        switch this.Algo
        case {'LMS','Sign-Data LMS'}
            info{UTU}.Visible = 0.0;
            info{WTU}.Visible = 1.0;
            info{MUE}.Visible = 1.0;
            info{QU}.Visible = 1.0;
            info{QUOT}.Visible = 0.0;
        case 'Normalized LMS'
            info{UTU}.Visible = 1.0;
            info{WTU}.Visible = 1.0;
            info{MUE}.Visible = 1.0;
            info{QU}.Visible = 1.0;
            info{QUOT}.Visible = 1.0;
        case {'Sign-Error LMS','Sign-Sign LMS'}
            info{UTU}.Visible = 0.0;
            info{WTU}.Visible = 1.0;
            info{MUE}.Visible = 0.0;
            info{QU}.Visible = 1.0;
            info{QUOT}.Visible = 0.0;
        end % switch
        % 49 50
        info{UTU}.Name = 'u''u:';
        info{WTU}.Name = 'W''u:';
        info{MUE}.Name = 'mu*e:';
        info{QU}.Name = 'Q*u:';
        info{QUOT}.Name = 'quotient:';
    end % switch
end % function
