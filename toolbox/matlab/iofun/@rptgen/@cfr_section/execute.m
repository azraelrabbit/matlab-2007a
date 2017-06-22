function out = execute(this, d, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if strcmp(this.NumberMode, 'manual')
        attList = cellhorzcat('label', rptgen.parseExpressionText(this.Number));
    else
        % 13 15
        attList = {};
    end % if
    % 16 18
    this.makeSection(d, attList);
    % 18 20
    childComponent = this.down;
    if this.isTitleFromSubcomponent && not(isempty(childComponent))
        titleContent = childComponent;
        childComponent = childComponent.right;
    else
        titleContent = rptgen.parseExpressionText(this.SectionTitle);
    end % if
    % 26 28
    this.addTitle(d, titleContent);
    % 28 31
    % 29 31
    if not(isempty(childComponent))
        this.writeChildren(d, childComponent);
    end % if
    % 33 35
    out = this.closeSection;
