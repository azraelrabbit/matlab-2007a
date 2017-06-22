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
    % 11 12
    switch this.TitleType
    case 'none'
        iTitle = '';
    case 'manual'
        iTitle = rptgen.parseExpressionText(this.Title);
    otherwise
        psHG = rptgen_hg.propsrc_hg;
        iTitle = psHG.getObjectName(figH);
    end % switch
end % function
