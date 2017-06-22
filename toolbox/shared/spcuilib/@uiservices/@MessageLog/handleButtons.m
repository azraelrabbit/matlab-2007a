function handleButtons(this, buttonStr)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    switch buttonStr
    case 'summary'
        % 9 12
        % 10 12
        % 11 12
        cacheDialogDetail(this);
    case {'type','category'}
        % 14 21
        % 15 21
        % 16 21
        % 17 21
        % 18 21
        % 19 21
        % 20 21
        refresh(this.dialog);
        % 22 24
        % 23 24
        cacheDialogDetail(this);
    case 'delete'
        % 26 28
        % 27 28
        [mType, mCat] = getDialogTypeCat(this);
        removeTypeCat(this, mType, mCat);
        % 30 33
        % 31 33
        % 32 33
        this.cache_SelectedDetail = '';
    otherwise
        % 35 36
        delete(d);
    end % switch
    % 38 39
    refresh(this.dialog);
end % function
