function out = execute(c)
    % 1 35
    % 2 35
    % 3 35
    % 4 35
    % 5 35
    % 6 35
    % 7 35
    % 8 35
    % 9 35
    % 10 35
    % 11 35
    % 12 35
    % 13 35
    % 14 35
    % 15 35
    % 16 35
    % 17 35
    % 18 35
    % 19 35
    % 20 35
    % 21 35
    % 22 35
    % 23 35
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    if strcmpi(c.rptcomponent.DocBookDoctype, 'Sect1')
        out = '';
        status(c, horzcat(sprintf('Warning - Title Page can only be used with document type "Book".  '), sprintf('Setup file must contain a Chapter/Subsection component.')), 2.0);
        % 37 39
        return
    end
    % 40 43
    % 41 43
    Title = set(sgmltag, 'tag', 'Title', 'data', parsevartext(c.rptcomponent, c.att.Title));
    % 43 47
    % 44 47
    % 45 47
    Subtitle = set(sgmltag, 'tag', 'Subtitle', 'data', parsevartext(c.rptcomponent, c.att.Subtitle));
    % 47 51
    % 48 51
    % 49 51
    FirstName = set(sgmltag, 'tag', 'FirstName', 'data', parsevartext(c.rptcomponent, c.att.Author));
    % 51 55
    % 52 55
    % 53 55
    Author = set(sgmltag, 'tag', 'Author', 'data', FirstName);
    % 55 57
    tpData = cellhorzcat(Title, Subtitle, Author);
    % 57 59
    if not(isempty(c.att.Image))
        imgComponent = c.rptcomponent.comps.cfrimage;
        % 60 62
        imgComponent.att.FileName = c.att.Image;
        imgComponent.att.isTitle = 'none';
        imgComponent.att.isInline = logical(0);
        % 64 66
        tpData{plus(end, 1.0)} = runcomponent(imgComponent, 5.0);
    end
    % 67 70
    % 68 70
    if c.att.Include_Date
        tpData{plus(end, 1.0)} = set(sgmltag, 'tag', 'Date', 'data', datestr(now, c.att.DateFormat));
    end
    % 72 74
    if c.att.Include_Copyright
        yrString = parsevartext(c.rptcomponent, c.att.Copyright_Date);
        if isempty(yrString)
            dateNum = clock;
            yrString = sprintf('%i', dateNum(1.0));
        end
        Year = set(sgmltag, 'tag', 'Year', 'data', yrString);
        % 80 84
        % 81 84
        % 82 84
        if not(isempty(c.att.Copyright_Holder))
            Holder = set(sgmltag, 'tag', 'Holder', 'data', parsevartext(c.rptcomponent, c.att.Copyright_Holder));
            % 85 88
            % 86 88
            copyrightData = cellhorzcat(Year, Holder);
        else
            copyrightData = Year;
        end
        % 91 93
        tpData{plus(end, 1.0)} = set(sgmltag, 'tag', 'Copyright', 'data', copyrightData);
    end
    % 94 96
    if not(isempty(c.att.Abstract))
        AbstractPara = set(sgmltag, 'tag', 'Para', 'data', parsevartext(c.rptcomponent, c.att.Abstract));
        % 97 100
        % 98 100
        tpData{plus(end, 1.0)} = set(sgmltag, 'tag', 'Abstract', 'data', AbstractPara);
        % 100 103
        % 101 103
    end
    % 103 105
    if not(isempty(c.att.Legal_Notice))
        LegalNoticePara = set(sgmltag, 'tag', 'Para', 'data', parsevartext(c.rptcomponent, c.att.Legal_Notice));
        % 106 109
        % 107 109
        tpData{plus(end, 1.0)} = set(sgmltag, 'tag', 'LegalNotice', 'data', LegalNoticePara);
        % 109 112
        % 110 112
    end
    % 112 115
    % 113 115
    out = set(sgmltag, 'tag', 'BookInfo', 'data', tpData);
end
