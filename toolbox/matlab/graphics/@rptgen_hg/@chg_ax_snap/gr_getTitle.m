function iTitle = gr_getTitle(this, fileName, figH)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    switch this.TitleType
    case 'none'
        iTitle = '';
    case 'manual'
        % 15 17
        iTitle = rptgen.parseExpressionText(this.Title);
    otherwise
        % 18 20
        axH = find(handle(figH), 'type', 'axes', '-not', 'tag', 'scribeOverlay');
        % 20 23
        % 21 23
        if not(isempty(axH))
            psHG = rptgen_hg.propsrc_hg;
            iTitle = psHG.getObjectName(axH(1.0));
        else
            iTitle = '';
        end % if
    end % switch
