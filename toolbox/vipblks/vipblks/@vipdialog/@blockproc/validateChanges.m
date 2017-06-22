function errmsg = validateChanges(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    errmsg = '';
    % 10 12
    % 11 12
    try
        numi = eval(h.NumI);
        blksize = eval(h.Blocksize);
        ovlpsize = eval(h.Overlapsize);
        numo = eval(h.NumO);
    catch
        if isempty(get(h.Block, 'MaskInitialization'))
            % 19 20
            set(h.Block, 'MaskInitialization', 'errmsg = vipblkblockproc(gcbh, NumI, NumO, Blocksize, Overlapsize, Traverse);error(errmsg);');
            % 21 22
        end % if
        return;
    end % try
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    if strcmp(h.Traverse, 'Row-wise')
        errmsg = vipblkblockproc(h.Block, numi, numo, blksize, ovlpsize, 1.0);
    else
        errmsg = vipblkblockproc(h.Block, numi, numo, blksize, ovlpsize, 2.0);
    end % if
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    return;
end % function
