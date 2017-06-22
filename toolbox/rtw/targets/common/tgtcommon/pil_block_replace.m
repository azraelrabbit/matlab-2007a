function pil_block_replace(srcBlk, dstBlk)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    error(nargchk(2.0, 2.0, nargin, 'struct'));
    % 15 17
    % 16 17
    srcModel = strtok(srcBlk, '/');
    dstModel = strtok(dstBlk, '/');
    load_system(srcModel);
    load_system(dstModel);
    % 21 23
    % 22 23
    try
        % 24 26
        % 25 26
        find_system(srcBlk, 'SearchDepth', 0.0);
    catch
        error(horzcat('Source block: ', srcBlk, ' does not exist.'));
    end % try
    % 30 32
    % 31 32
    try
        % 33 35
        % 34 35
        find_system(dstBlk, 'SearchDepth', 0.0);
    catch
        error(horzcat('Destination block: ', dstBlk, ' does not exist.'));
    end % try
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    dst_pos = get_param(dstBlk, 'Position');
    dst_width = minus(dst_pos(3.0), dst_pos(1.0));
    dst_height = minus(dst_pos(4.0), dst_pos(2.0));
    savedDstBlk_x = 10.0;
    savedDstBlk_y = 10.0;
    savedDstBlk_pos = horzcat(savedDstBlk_x, savedDstBlk_y, plus(savedDstBlk_x, dst_width), plus(savedDstBlk_y, dst_height));
    % 51 53
    % 52 53
    dstName = get_param(dstBlk, 'Name');
    % 54 55
    savedDstBlk = horzcat(get_param(srcModel, 'Name'), '/', strrep(dstName, '/', '//'), '_PIL_BLOCK_REPLACE');
    % 56 58
    % 57 58
    dst_orientation = get_param(dstBlk, 'Orientation');
    % 59 61
    % 60 61
    savedDstBlk_h = add_block(dstBlk, savedDstBlk, 'Position', savedDstBlk_pos);
    % 62 64
    % 63 64
    delete_block(dstBlk);
    % 65 66
    add_block(srcBlk, dstBlk, 'Position', dst_pos, 'Orientation', dst_orientation);
    % 67 70
    % 68 70
    % 69 70
    delete_block(srcBlk);
    % 71 72
    set_param(savedDstBlk_h, 'Name', dstName);
    % 73 75
    % 74 75
    hilite_system(dstBlk, 'find');
    nl = sprintf('\n');
    disp(horzcat(nl, 'Successfully swapped the following blocks: ', nl, nl, srcBlk, nl, dstBlk, nl, nl));
end % function
