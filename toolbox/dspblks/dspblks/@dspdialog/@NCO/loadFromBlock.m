function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.AccIncSrc = this.Block.AccIncSrc;
    this.AccInc = this.Block.AccInc;
    this.PhaseOffsetSrc = this.Block.PhaseOffsetSrc;
    this.PhaseOffset = this.Block.PhaseOffset;
    this.AccumWL = this.Block.AccumWL;
    this.Formula = this.Block.Formula;
    this.HasPhaseQuantizer = strcmpi(this.Block.HasPhaseQuantizer, 'on');
    this.HasOutputPhaseError = strcmpi(this.Block.HasOutputPhaseError, 'on');
    this.HasDither = strcmpi(this.Block.HasDither, 'on');
    this.DitherWL = this.Block.DitherWL;
    this.PNgeneratorLength = this.Block.PNgeneratorLength;
    this.SampleTime = this.Block.SampleTime;
    this.SamplesPerFrame = this.Block.SamplesPerFrame;
    this.DataType = this.Block.DataType;
    this.OutputWL = this.Block.OutputWL;
    this.OutputFL = this.Block.OutputFL;
    this.CompMethod = this.Block.CompMethod;
    this.TableDepth = this.Block.TableDepth;
end % function
