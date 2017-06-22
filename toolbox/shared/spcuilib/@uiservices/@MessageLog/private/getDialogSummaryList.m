function [hdr, tbl, idx] = getDialogSummaryList(hMessageLog)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    maxCatWidth = max(cellfun(@numel, catList(hMessageLog)));
    catWidth = max(maxCatWidth, numel('Category'));
    % 10 14
    % 11 14
    % 12 14
    hdrfmt = horzcat('%-4s %-', sprintf('%d', catWidth), 's %-25s');
    hdrstr = {'Type','Category','Summary'};
    hdr = sprintf(hdrfmt, hdrstr{:});
    % 16 19
    % 17 19
    hdr = horzcat(' ', hdr);
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    [mType, mCat] = getDialogTypeCat(hMessageLog);
    allType = strcmpi(mType, 'all');
    allCat = strcmpi(mCat, 'all');
    % 26 30
    % 27 30
    % 28 30
    hMergedLog = cacheMergedLog(hMessageLog);
    % 30 33
    % 31 33
    tbl = {};
    idx = [];
    i = 0.0;
    hMsg = hMergedLog.down('last');
        while not(isempty(hMsg))
        if allType || strcmpi(hMsg.Type, mType)
            if allCat || strcmpi(hMsg.Category, mCat)
                % 39 42
                % 40 42
                tbl = horzcat(tbl, cellhorzcat(sprintf(hdrfmt, capital(hMsg.Type), capital(hMsg.Category), hMsg.Summary)));
                % 42 47
                % 43 47
                % 44 47
                % 45 47
                idx = horzcat(idx, i);
            end % if
        end % if
        hMsg = hMsg.left;
        i = plus(i, 1.0);
    end % while
