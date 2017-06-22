function out = execute(this, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    out = [];
    % 9 11
    try
        tContent = this.list_getContent(d);
    catch
        this.status(lasterr, 1.0);
        return;
    end % try
    % 16 18
    if not(isempty(tContent))
        % 18 20
        m = com.mathworks.toolbox.rptgencore.docbook.ListMaker(tContent);
        % 20 22
        m.setTitle(this.list_getTitle(d));
        m.setListType(this.ListStyle);
        m.setNumerationType(this.NumerationType);
        m.setInheritnumType(this.NumInherit);
        m.setContinuationType(this.NumContinue);
        m.setSpacingType(this.Spacing);
        % 27 29
        out = m.createList(java(d));
    else
        this.status('Empty list content', 5.0);
    end % if
