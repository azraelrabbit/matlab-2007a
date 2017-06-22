function makeSection(this, d, xmlAttributes)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    adRG = rptgen.appdata_rg;
    % 18 20
    this.RuntimeRelativeFileName = '';
    % 20 24
    % 21 24
    % 22 24
    sType = this.getSectionType;
    this.RuntimeSectionType = sType;
    % 25 28
    % 26 28
    dbIdx = adRG.DocbookSectionCounter;
    dbIdx = plus(dbIdx, 1.0);
    this.RuntimeSectionIndex = dbIdx;
    adRG.DocbookSectionCounter = dbIdx;
    % 31 33
    this.RuntimeSerializer = com.mathworks.toolbox.rptgencore.output.IncrementalXmlSerializer(java(d), this.getSectionFileName(adRG), adRG.RootComponent.RuntimeFileEncoding);
    % 33 37
    % 34 37
    % 35 37
    this.writeXmlHeader;
    % 37 39
    if lt(nargin, 3.0)
        xmlAttributes = {};
    end % if
    % 41 43
    if this.RuntimeSerializer.openRootElement(sType, xmlAttributes)
        this.writeProcessingInstruction('dbhtml', sprintf('filename="%s"', this.getChunkFileName(adRG)));
        % 44 46
    end % if
