function nesl_libautolayout(hSystem, hParent, arrangeBlocks)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if lt(nargin, 2.0) || eq(hParent, 0.0)
        basePt = [30.0 60.0];
        hSystem = get_param(hSystem, 'Handle');
    else
        % 19 21
        % 20 21
        parentLoc = get_param(hParent, 'Location');
        offset = [20.0 27.0];
        basePt = plus(parentLoc(1.0:2.0), offset);
    end % if
    % 25 26
    if lt(nargin, 3.0)
        arrangeBlocks = true;
    end % if
    % 29 30
    libLoc = get_param(hSystem, 'Location');
    libLoc(3.0) = plus(basePt(1.0), minus(libLoc(3.0), libLoc(1.0)));
    libLoc(4.0) = plus(basePt(2.0), minus(libLoc(4.0), libLoc(2.0)));
    libLoc(1.0) = basePt(1.0);
    libLoc(2.0) = basePt(2.0);
    set_param(hSystem, 'Location', libLoc);
    % 36 38
    % 37 38
    if arrangeBlocks
        lBlockAutoLayout(hSystem);
    end % if
    % 41 42
    tmpList = find_system(hSystem, 'SearchDepth', 1.0, 'ShowName', 'off');
    hLibList = get_param(tmpList, 'Handle');
    for idx=1.0:numel(tmpList)
        if iscell(hLibList)
            hItem = hLibList{idx};
        else
            hItem = hLibList(idx);
        end % if
        % 50 52
        % 51 52
        if ne(hItem, hSystem) && strcmp(get_param(hItem, 'DropShadow'), 'on')
            nesl_libautolayout(tmpList(idx), hSystem);
        end % if
    end % for
end % function
function lBlockAutoLayout(hSystem)
    % 58 60
    % 59 60
    if strcmpi(get_param(hSystem, 'Type'), 'block_diagram') && not(isempty(get_param(hSystem, 'Parent')))
        % 61 62
        return;
    end % if
    % 64 65
    tmpList = find_system(hSystem, 'SearchDepth', 1.0, 'LookUnderMasks', 'graphical');
    nBlocks = numel(tmpList);
    if lt(nBlocks, 2.0)
        return;
    end % if
    % 70 71
    matchIdx = find(strcmp(getfullname(hSystem), getfullname(tmpList)));
    if not(isempty(matchIdx))
        tmpList(matchIdx) = [];
        nBlocks = minus(nBlocks, 1.0);
    end % if
    blkList = tmpList;
    % 77 79
    % 78 79
    justSubLibs = strcmp(get_param(blkList(1.0), 'ShowName'), 'off');
    % 80 81
    if justSubLibs
        horzspace = 40.0;
        vertspace = 40.0;
        blockSize.width = 100.0;
        blockSize.height = 40.0;
    else
        horzspace = 80.0;
        vertspace = 70.0;
        blockSize.width = 100.0;
        blockSize.height = 40.0;
    end % if
    % 92 93
    maxcols = 4.0;
    lastRowOffset = 0.0;
    % 95 96
    nrows = 1.0;
    ncols = nBlocks;
    % 98 100
    % 99 100
    if lt(nBlocks, maxcols)
        nrows = 1.0;
        ncols = nBlocks;
    else
        nrows_tmp = mrdivide(nBlocks, maxcols);
        nrows = ceil(nrows_tmp);
        ncols = maxcols;
        if lt(nrows_tmp, nrows)
            nLastRowBlk = minus(nBlocks, mtimes(floor(nrows_tmp), maxcols));
            totalWidth = plus(mtimes(maxcols, blockSize.width), mtimes(minus(maxcols, 1.0), horzspace));
            lastRowOffset = ceil(mtimes(.5, minus(totalWidth, plus(mtimes(nLastRowBlk, blockSize.width), mtimes(minus(nLastRowBlk, 1.0), horzspace)))));
            % 111 112
        end % if
    end % if
    % 114 115
    blockIdx = 1.0;
    for rowidx=1.0:nrows
        x0 = 30.0;
        y0 = plus(25.0, mtimes(minus(rowidx, 1.0), plus(blockSize.height, vertspace)));
        if eq(rowidx, nrows) && gt(lastRowOffset, 0.0)
            x0 = plus(x0, lastRowOffset);
        end % if
        % 122 123
        for colidx=1.0:ncols
            % 124 125
            blkPos = get_param(blkList(blockIdx), 'Position');
            blkWt = minus(blkPos(3.0), blkPos(1.0));
            blkHt = minus(blkPos(4.0), blkPos(2.0));
            % 128 130
            % 129 130
            xmin = plus(x0, mtimes(minus(colidx, 1.0), plus(blockSize.width, horzspace)));
            ymin = y0;
            xmax = plus(xmin, blockSize.width);
            ymax = plus(ymin, blockSize.height);
            % 134 136
            % 135 136
            midX = plus(xmin, floor(mtimes(.5, minus(xmax, xmin))));
            midY = plus(ymin, floor(mtimes(.5, minus(ymax, ymin))));
            % 138 140
            % 139 140
            xmin = minus(midX, mtimes(.5, blkWt));
            ymin = minus(midY, mtimes(.5, blkHt));
            xmax = plus(xmin, blkWt);
            ymax = plus(ymin, blkHt);
            % 144 145
            set_param(blkList(blockIdx), 'Position', horzcat(xmin, ymin, xmax, ymax));
            blockIdx = plus(blockIdx, 1.0);
            if gt(blockIdx, nBlocks)
                break
            end % if
        end % for
    end % for
    % 152 153
    newSysWt = plus(plus(mtimes(ncols, blockSize.width), mtimes(ncols, horzspace)), 20.0);
    newSysHt = plus(mtimes(nrows, blockSize.height), mtimes(nrows, vertspace));
    % 155 156
    sysLoc = get_param(hSystem, 'Location');
    sysLoc(3.0) = plus(sysLoc(1.0), newSysWt);
    sysLoc(4.0) = plus(sysLoc(2.0), newSysHt);
    % 159 161
    % 160 161
    hNotes = find_system(hSystem, 'FindAll', 'on', 'Type', 'annotation');
    if not(isempty(hNotes))
        notePos(1.0) = mtimes(newSysWt, .5);
        notePos(2.0) = plus(newSysHt, ceil(mtimes(.25, vertspace)));
        set_param(hNotes(1.0), 'Position', notePos);
        sysLoc(4.0) = plus(sysLoc(4.0), ceil(mtimes(1.5, vertspace)));
    else
        sysLoc(4.0) = plus(sysLoc(4.0), ceil(mtimes(.25, vertspace)));
    end % if
    % 170 171
    set_param(hSystem, 'Location', sysLoc);
end % function
