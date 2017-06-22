function dlgStruct = getDialogSchema(this, str)
    % 1 34
    % 2 34
    % 3 34
    % 4 34
    % 5 34
    % 6 34
    % 7 34
    % 8 34
    % 9 34
    % 10 34
    % 11 34
    % 12 34
    % 13 34
    % 14 34
    % 15 34
    % 16 34
    % 17 34
    % 18 34
    % 19 34
    % 20 34
    % 21 34
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    this.paramsMap = this.getDialogParams;
    % 35 37
    % 36 37
    h = this.getBlock;
    % 38 40
    % 39 40
    try
        switch h.MaskType
        case 'Generate FlightGear Run Script'
            dlgStruct = genrnddg(this, h);
        otherwise
            dlgStruct = errorDlg(this, h, 'Unknown block type');
            warning('DDG:SLDialogSource', horzcat('Unknown block type in DDGSource ', mfilename));
        end % switch
    catch
        dlgStruct = errorDlg(this, h);
    end % try
end % function
function dlgStruct = errorDlg(source, h, varargin)
    % 53 54
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
