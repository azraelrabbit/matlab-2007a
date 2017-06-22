function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.CompMethod = this.Block.CompMethod;
    this.TableOpt = this.Block.TableOpt;
    this.BitRevOrder = strcmpi(this.Block.BitRevOrder, 'on');
    this.cs_in = strcmpi(this.Block.cs_in, 'on');
    this.SkipNorm = strcmpi(this.Block.SkipNorm, 'on');
    this.InheritFFTLength = strcmpi(this.Block.InheritFFTLength, 'on');
    this.FFTLength = this.Block.FFTLength;
    % 16 17
    this.FixptDialog.loadFromBlock;
end % function
