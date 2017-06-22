function out = execute(c, d, varargin)
    % 1 40
    % 2 40
    % 3 40
    % 4 40
    % 5 40
    % 6 40
    % 7 40
    % 8 40
    % 9 40
    % 10 40
    % 11 40
    % 12 40
    % 13 40
    % 14 40
    % 15 40
    % 16 40
    % 17 40
    % 18 40
    % 19 40
    % 20 40
    % 21 40
    % 22 40
    % 23 40
    % 24 40
    % 25 40
    % 26 40
    % 27 40
    % 28 40
    % 29 40
    % 30 40
    % 31 40
    % 32 40
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    theTitle = rptgen.parseExpressionText(c.Title);
    % 40 42
    rootElement = rptgen.rpt_section.getParentSectionType(c);
    if isempty(rootElement)
        rootElement = 'book';
    end % if
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    out = createElement(d, horzcat(rootElement, 'info'));
    out.appendChild(createElement(d, 'title', theTitle));
    out.appendChild(createElement(d, 'subtitle', rptgen.parseExpressionText(c.Subtitle)));
    % 52 54
    switch c.AuthorMode
    case 'none'
        authorName = '';
    case 'auto'
        authorName = java.lang.System.getProperty('user.name');
    otherwise
        authorName = rptgen.parseExpressionText(c.Author);
    end % switch
    % 61 63
    if not(isempty(authorName))
        out.appendChild(createElement(d, 'author', createElement(d, 'firstname', authorName)));
        % 64 66
    end % if
    % 66 68
    if not(isempty(c.Image))
        % 68 73
        % 69 73
        % 70 73
        % 71 73
        if isa(c.Image, 'rptgen.rptcomponent')
            imgComponent = c.Image;
        else
            imgComponent = rptgen.cfr_image('FileName', c.Image, 'isInline', false);
            % 76 79
            % 77 79
        end % if
        % 79 81
        imgTag = imgComponent.runComponent(d);
        if not(isempty(imgTag))
            out.appendChild(imgTag);
        end % if
    end % if
    % 85 87
    if c.Include_Date
        out.appendChild(createElement(d, 'pubdate', datestr(now, c.DateFormat)));
    end % if
    % 89 91
    if c.Include_Copyright
        cTag = createElement(d, 'copyright');
        out.appendChild(cTag);
        % 93 96
        % 94 96
        yrString = rptgen.parseExpressionText(c.Copyright_Date);
        if isempty(yrString)
            dateNum = clock;
            yrString = sprintf('%i', dateNum(1.0));
        end % if
        cTag.appendChild(createElement(d, 'year', yrString));
        % 101 103
        if not(isempty(c.Copyright_Holder))
            cTag.appendChild(createElement(d, 'holder', rptgen.parseExpressionText(c.Copyright_Holder)));
        end % if
        % 105 107
    end % if
    % 107 109
    if not(isempty(c.Abstract))
        % 109 111
        out.appendChild(createElement(d, 'abstract', createElement(d, 'para', rptgen.parseExpressionText(c.Abstract))));
        % 111 114
        % 112 114
    end % if
    % 114 116
    if not(isempty(c.Legal_Notice))
        % 116 118
        out.appendChild(createElement(d, 'legalnotice', createElement(d, 'para', rptgen.parseExpressionText(c.Legal_Notice))));
        % 118 121
        % 119 121
    end % if
