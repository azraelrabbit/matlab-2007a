function retStatus = Realize(hThis)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hBlk = pm_getsl_dblhandle(hThis.BlockHandle);
    % 11 12
    retStatus = true;
    if ne(hBlk, 0.0)
        try
            hBlock = get_param(hBlk, 'ReferenceBlock');
            if isempty(hBlock)
                hBlock = hBlk;
            end % if
            tmpText = get_param(hBlock, 'MaskDescription');
            tmpTitle = get_param(hBlock, 'Name');
        catch
            disp(lasterror.message);
            retVal = false;
            hThis.Need2Realize = true;
            retStatus = false;
            return;
        end % try
        retVal = true;
        hThis.DescrText = tmpText;
        hThis.BlockTitle = tmpTitle;
    end % if
    % 32 33
    hThis.Need2Realize = false;
    % 34 35
end % function
