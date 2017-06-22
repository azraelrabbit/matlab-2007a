function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if strcmpi(this.Block.filtFrom, 'dialog')
        this.FilterSource = 0.0;
    else
        this.FilterSource = 1.0;
    end % if
    % 14 15
    this.mfiltObjectName = this.Block.filtobj;
    this.FilterStructure = this.Block.ftype;
    this.DecimationFactor = this.Block.R;
    this.DifferentialDelay = this.Block.M;
    this.NumberOfSections = this.Block.N;
    this.FilterInternals = this.Block.filterInternals;
    this.SectionWordLengths = this.Block.BPS;
    this.SectionFracLengths = this.Block.FLPS;
    this.OutputWordLength = this.Block.outputWordLength;
    this.OutputFracLength = this.Block.outputFracLength;
end % function
