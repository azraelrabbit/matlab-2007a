function list = getPropList(h, filterName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch filterName
    case 'main'
        list = {'OutDataType';'Scaling';'Min';'MinValue';'Max';'MaxValue'};
        % 10 17
        % 11 17
        % 12 17
        % 13 17
        % 14 17
        % 15 17
    case 'mask'
        % 16 18
        list = {'OutDataType';'OutScaling';'LockScale';'RndMeth';'DoSatur';'DblOver'};
        % 19 26
        % 20 26
        % 21 26
        % 22 26
        % 23 26
        % 24 26
    case 'signal'
        % 25 27
        list = {'DataType';'MantBits';'FixExp';'Slope';'Bias';'Scaling';'MinValue';'TimeOfMin';'MaxValue';'TimeOfMax';'MinLim';'MaxLim';'Resolution'};
        % 28 42
        % 29 42
        % 30 42
        % 31 42
        % 32 42
        % 33 42
        % 34 42
        % 35 42
        % 36 42
        % 37 42
        % 38 42
        % 39 42
        % 40 42
    case 'errors'
        % 41 43
        list = {'OverflowOccurred';'SaturationOccurred';'ParameterSaturationOccurred';'DivisionByZeroOccurred'};
        % 44 49
        % 45 49
        % 46 49
        % 47 49
    case 'all'
        % 48 50
        list = vertcat(h.getPropList('mask'), h.getPropList('signal'), h.getPropList('errors'));
        % 51 53
    case 'blkall'
        % 52 55
        % 53 55
        list = getPropList(rptgen_sl.propsrc_sl_blk, 'all');
    case 'slmain'
        % 56 58
        list = getPropList(rptgen_sl.propsrc_sl_blk, 'main');
    otherwise
        list = {};
    end % switch
