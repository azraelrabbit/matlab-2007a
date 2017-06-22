function setSingleValueMode(this, newMode)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if lt(nargin, 2.0)
        newMode = this.SingleValueMode;
        oldMode = not(newMode);
    else
        oldMode = this.SingleValueMode;
        this.SingleValueMode = newMode;
    end
    % 19 21
    cWid = this.ColWidths;
    if gt(this.SingleValueMode, oldMode)
        % 22 24
        cWidLeft = mtimes(cWid, .3);
        cWidRight = mtimes(cWid, .7);
        cWid = ctranspose(horzcat(cWidLeft(:), cWidRight(:)));
        cWid = ctranspose(cWid(:));
    else
        if lt(this.SingleValueMode, oldMode)
            cWid = reshape(cWid, 2.0, mrdivide(length(cWid), 2.0));
            cWid = sum(cWid);
        end
    end
    this.ColWidths = cWid;
    if not(isempty(findprop(this, 'DlgInfo'))) && not(isempty(this.DlgInfo)) && not(isempty(this.DlgInfo.SingleValueMode)) && ishandle(this.DlgInfo.SingleValueMode)
        % 35 41
        % 36 41
        % 37 41
        % 38 41
        % 39 41
        set(this.DlgInfo.SingleValueMode, 'value', this.SingleValueMode);
        this.dlgEditor('Redraw');
        this.dlgEditor('CellSelect');
    end
end
