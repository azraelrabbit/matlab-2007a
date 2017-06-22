function hBlackBoxC = createBlackBoxComp(this, hN, hC)
    % 1 29
    % 2 29
    % 3 29
    % 4 29
    % 5 29
    % 6 29
    % 7 29
    % 8 29
    % 9 29
    % 10 29
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    bbxStrategyType = this.CodeGenMode;
    % 29 31
    hBlackBoxC = hN.addComponent('black_box_comp', bbxStrategyType, hC.numberofInputPorts, hC.numberofOutputPorts);
    % 31 35
    % 32 35
    % 33 35
    userData.CodeGenFunction = this.CodeGenFunction;
    % 35 37
    if isempty(this.CodeGenParams)
        params = {};
    else
        if iscell(this.CodeGenParams)
            params = this.CodeGenParams;
        else
            params = cellhorzcat(this.CodeGenParams);
        end % if
    end % if
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    switch this.FirstParam
    case 'useobjandcomphandles'
        % 51 53
        firstArgs = cellhorzcat(this, hBlackBoxC);
    case 'usecomphandle'
        % 54 56
        firstArgs = cellhorzcat(hBlackBoxC);
    case 'useslhandle'
        % 57 59
        firstArgs = cellhorzcat(hC.SimulinkHandle);
    otherwise
        error(hdlcodererrormsgid('invalidemission'), 'Internal error: invalid HDLEmissionHandleType');
        % 61 63
    end % switch
    % 63 73
    % 64 73
    % 65 73
    % 66 73
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    userData.CodeGenParams = cellhorzcat(firstArgs{:}, params{:});
    % 73 75
    userData.EstimateFunction = this.estimateFunction;
    if iscell(this.estimateParams)
        userData.EstimateParams = this.estimateParams;
    else
        userData.EstimateParams = cellhorzcat(this.estimateParams);
    end % if
    % 80 82
    userData.EstimateParams = cat(1.0, firstArgs, userData.EstimateParams{:});
    % 82 84
    userData.generateSLBlockFunction = this.generateSLBlockFunction;
    userData.generateSLBlockParams = firstArgs;
    % 85 88
    % 86 88
    hBlackBoxC.ImplementationData = userData;
    % 88 91
    % 89 91
    hBlackBoxC.SimulinkHandle = hC.SimulinkHandle;
    % 91 94
    % 92 94
    hBlackBoxC.Name = hC.Name;
end % function
