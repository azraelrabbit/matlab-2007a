function prevState = makeDocumentPre(this, d)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    javaMethod('staticClearMessages', 'com.mathworks.toolbox.rptgencore.GenerationDisplayClient');
    % 8 10
    this.status(xlate('Beginning report'), 3.0);
    % 10 13
    % 11 13
    try
        this.ApplicationDataObjects = this.initialize;
    catch
        this.status(lasterr, 1.0);
    end % try
    % 17 19
    prevState = rptgen.ReportState(this);
    % 19 21
    adRG = rptgen.appdata_rg;
    adRG.RootComponent = this;
    % 22 24
    adRG.DebugMode = this.isDebug;
    prevState.Debug = rptgen.changeDebugState(this.isDebug);
    if isa(this.up, 'RptgenML.Root') && not(isempty(this.up.Editor)) && com.mathworks.toolbox.rptgencore.tools.RptgenPrefsPanel.getRuntimeAnimate
        % 26 31
        % 27 31
        % 28 31
        % 29 31
        adRG.Editor = this.up.Editor;
    end % if
    % 32 35
    % 33 35
    if isempty(this.RptFileName)
        this.RptFileName = horzcat(tempname, '.rpt');
    end % if
    % 37 39
    this.getrptname;
    % 39 41
    this.status(this.Output.checkWritableFile, 2.0);
    % 41 45
    % 42 45
    % 43 45
    prevState.Language = get(0.0, 'language');
    if not(strcmp(this.Language, 'auto'))
        set(0.0, 'Language', this.Language);
        % 47 49
    end % if
    currLang = rpt_xml.getLanguage(this.Language);
    % 50 53
    % 51 53
    if strcmp(currLang, 'ja')
        enc = 'shift_jis';
    else
        enc = 'ISO-8859-1';
        % 56 60
        % 57 60
        % 58 60
    end % if
    this.Output.Language = currLang;
    this.RuntimeFileEncoding = enc;
    % 62 66
    % 63 66
    % 64 66
    adRG.CurrentDocument = d;
    this.makeSection(d, cellhorzcat('lang', currLang));
    % 67 71
    % 68 71
    % 69 71
    try
        rgVer = ver('rptgen');
        if not(isempty(rgVer))
            this.writeComment(sprintf('Created by: Report Generator v%s, The MathWorks Inc.', rgVer(1.0).Version));
            % 74 76
        end % if
    end % try
    % 77 79
    if not(isempty(this.Description))
        try
            this.writeComment(this.Description);
        end % try
    end % if
    % 83 86
    % 84 86
    haltGenerate = false;
    if strncmp(this.RuntimeSectionType, 'sect', 4.0)
        if strcmp(this.Format, 'latex')
            % 88 91
            % 89 91
            this.status(xlate('LaTeX reports must contain chapters.  Stopping report generation.'), 1.0);
            haltGenerate = true;
        end % if
    end % if
    % 94 96
    set(adRG, 'HaltGenerate', haltGenerate);
    % 96 98
    adRG.getImgName(this.isRegenerateImages);
