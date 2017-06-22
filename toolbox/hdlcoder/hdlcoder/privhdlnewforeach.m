function [ctrlstmt, implchoices] = privhdlnewforeach(block)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    cur_lasterror = lasterror;
    % 8 10
    ctrlstmt = '';
    implchoices = {};
    % 11 13
    if ischar(block)
        block = cellhorzcat(block);
    end
    % 15 18
    % 16 18
    for ii=1.0:length(block)
        % 18 20
        try
            hC = get_param(bdroot(block{ii}), 'HDLCoder');
        catch
            warning(hdlcodererrormsgid('blockinlibrary'), 'Cannot find required information--please make sure the block is in a model, not a library.')
            % 23 28
            % 24 28
            % 25 28
            % 26 28
            lasterror(cur_lasterror);
            % 28 30
            return
        end % try
        % 31 33
        if isempty(hC.ImplDB)
            hC.buildDatabase;
        end
        % 35 38
        % 36 38
        blkObj = get_param(block{ii}, 'Object');
        % 38 40
        modelScope = horzcat(blkObj.path, '/', blkObj.name);
        modelScope = strrep(modelScope, char(10.0), ' ');
        [blockScope, isInvalid] = hdlgetblocklibpath(block{ii});
        blockScope = strrep(blockScope, char(10.0), ' ');
        % 43 45
        if isInvalid
            error(hdlcodererrormsgid('invalid'), 'Cannot find block %s', block{ii});
            % 46 48
        end
        % 48 50
        if isempty(hC.ConfigManager)
            warning(hdlcodererrormsgid('NoConfigManager'), 'Cannot find required information--please run checkhdl or makehdl first.')
            % 51 56
            % 52 56
            % 53 56
            % 54 56
            lasterror(cur_lasterror);
            % 56 58
            return
        end
        try
            defaultImpl = hC.ConfigManager.getDefaultImplementation(blockScope);
        catch
            warning(hdlcodererrormsgid('NoConfigManagerDefaults'), 'Cannot find required information--please run checkhdl or makehdl first.')
            % 63 68
            % 64 68
            % 65 68
            % 66 68
            lasterror(cur_lasterror);
            % 68 70
            return
        end % try
        % 71 75
        % 72 75
        % 73 75
        if isempty(defaultImpl) && any(strmatch(blockScope, {'built-in/SubSystem'}, 'exact'))
            % 75 78
            % 76 78
            implchoices = cellhorzcat(implchoices{:}, hC.ImplDB.getImplementationsFromBlock(blockScope));
        else
            % 79 83
            % 80 83
            % 81 83
            if ~(isempty(defaultImpl) || any(strmatch(blockScope, {'built-in/Inport','built-in/Outport'}, 'exact')))
                % 83 88
                % 84 88
                % 85 88
                % 86 88
                implchoices = cellhorzcat(implchoices{:}, hC.ImplDB.getImplementationsFromBlock(blockScope));
                ctrlstmt = horzcat(ctrlstmt, sprintf('c.forEach(''%s'',...\n ''%s'', {},...\n ''%s'', {});\n\n', modelScope, blockScope, class(defaultImpl)));
                % 89 93
                % 90 93
                % 91 93
            end
        end
        % 94 96
    end % for
    % 96 100
    % 97 100
    % 98 100
    lasterror(cur_lasterror);
end
