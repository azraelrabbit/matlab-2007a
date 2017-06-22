function colWidth = getColWidth(this, col)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    colheader = this.getDimsPropTableColHeader;
    switch col
    case 'idxopt'
        block = this.getBlock;
        lstIdxOpts = block.getPropAllowedValues('IdxOptString');
        colWidth = length(colheader{this.getColId(col)});
        for i=1.0:length(lstIdxOpts)
            colWidth = max(colWidth, length(lstIdxOpts{i}));
        end % for
    case {'idx','outsize'}
        colWidth = length(colheader{this.getColId(col)});
    otherwise
        colWidth = -1.0;
    end % switch
    % 21 22
end % function
