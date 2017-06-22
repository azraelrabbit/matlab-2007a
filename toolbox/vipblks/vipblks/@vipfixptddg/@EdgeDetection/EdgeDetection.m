function this = EdgeDetection(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.EdgeDetection(block);
    this.init(block);
    % 12 13
    baseDTs = {};
    % 14 15
    otherDTs{1.0}.Name = 'Product output';
    otherDTs{1.0}.Prefix = 'prodOutput';
    otherDTs{1.0}.Entries = {'Same as first input','Binary point scaling','Slope and bias scaling'};
    % 18 21
    % 19 21
    % 20 21
    otherDTs{2.0}.Name = 'Accumulator';
    otherDTs{2.0}.Prefix = 'accum';
    otherDTs{2.0}.Entries = {'Same as product output','Same as first input','Binary point scaling','Slope and bias scaling'};
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    otherDTs{3.0}.Name = 'Gradients';
    otherDTs{3.0}.Prefix = 'output';
    otherDTs{3.0}.Entries = {'Same as accumulator','Same as product output','Same as first input','Binary point scaling','Slope and bias scaling'};
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 37 38
    this.loadFromBlock;
end % function
