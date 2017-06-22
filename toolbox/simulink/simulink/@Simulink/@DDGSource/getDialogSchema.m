function dlgStruct = getDialogSchema(this, str)
    % 1 35
    % 2 35
    % 3 35
    % 4 35
    % 5 35
    % 6 35
    % 7 35
    % 8 35
    % 9 35
    % 10 35
    % 11 35
    % 12 35
    % 13 35
    % 14 35
    % 15 35
    % 16 35
    % 17 35
    % 18 35
    % 19 35
    % 20 35
    % 21 35
    % 22 35
    % 23 35
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    this.paramsMap = this.getDialogParams;
    % 36 38
    % 37 38
    h = this.getBlock;
    % 39 41
    % 40 41
    try
        switch h.BlockType
        case 'Goto'
            dlgStruct = gotoddg(this, h);
        case 'From'
            dlgStruct = fromddg(this, h);
        case 'BusCreator'
            dlgStruct = busCreatorddg(this, h);
        case {'DataStoreRead','DataStoreWrite'}
            dlgStruct = dataStoreRWddg(this, h);
        case 'DataStoreMemory'
            dlgStruct = dataStoreMemddg(this, h);
        case 'S-Function'
            dlgStruct = sfunddg(this, h);
        case 'M-S-Function'
            dlgStruct = msfunlvl2ddg(this, h);
        case 'Lookup'
            dlgStruct = lookup1dddg(this, h);
        case 'Lookup2D'
            dlgStruct = lookup2dddg(this, h);
        case 'Interpolation_n-D'
            dlgStruct = interpndddg(this, h);
        case 'PreLookup'
            dlgStruct = prelookupddg(this, h);
        otherwise
            % 66 70
            % 67 70
            % 68 70
            % 69 70
            % 70 71
            dlgStruct = errorDlg(this, h, horzcat('Unknown block type: ', h.BlockType));
            warning('DDG:SLDialogSource', horzcat('Unknown block type in DDGSource ', mfilename));
        end % switch
    catch
        dlgStruct = errorDlg(this, h);
    end % try
end % function
function dlgStruct = errorDlg(source, h, varargin)
    % 79 80
    if isempty(varargin)
        txt.Name = horzcat('Error occurred when trying to create dialog', sprintf('\n'), lasterr);
    else
        txt.Name = horzcat('Problem occurred when trying to create dialog', sprintf('\n'), varargin{1.0});
    end % if
    txt.Type = 'text';
    dlgStruct.DialogTitle = horzcat('Block Parameters: ', h.BlockType);
    dlgStruct.Items = cellhorzcat(txt);
    dlgStruct.CloseMethod = 'closeCallback';
    dlgStruct.CloseMethodArgs = {'%dialog'};
    dlgStruct.CloseMethodArgsDT = {'handle'};
end % function
