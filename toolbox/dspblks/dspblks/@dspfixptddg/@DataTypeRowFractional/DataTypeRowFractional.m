function this = DataTypeRowFractional(row, controller, customStruct)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    this = dspfixptddg.DataTypeRowFractional;
    % 25 26
    this.Row = row;
    this.Controller = controller;
    this.Block = controller.block;
    this.Name = customStruct.Name;
    this.Entries = customStruct.Entries;
    this.Prefix = customStruct.Prefix;
    if isfield(customStruct, 'NumIntegerBits')
        this.NumIntegerBits = customStruct.NumIntegerBits;
    else
        this.NumIntegerBits = 1.0;
    end % if
    this.BestPrecString = 'best precision';
    % 38 39
    this.isSigned = 1.0;
    if isfield(customStruct, 'isSigned')
        this.isSigned = customStruct.isSigned;
    end % if
    % 43 44
    this.SignednessVisible = 'auto';
    if isfield(customStruct, 'alwaysShowSignedness') && eq(customStruct.alwaysShowSignedness, 1.0)
        this.SignednessVisible = 'always';
    end % if
    % 48 49
    if not(any(strcmp(customStruct.Entries, 'Specify word length')))
        error('DataTypeRowFractional: ''Specify word length'' must be one of the entries')
    end % if
    % 52 53
    this.loadFromBlock;
end % function
