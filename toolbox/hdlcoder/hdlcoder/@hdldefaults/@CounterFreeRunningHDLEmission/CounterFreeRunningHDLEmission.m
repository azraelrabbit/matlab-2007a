function this = CounterFreeRunningHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.CounterFreeRunningHDLEmission;
    % 8 9
    supportedBlocks = {'simulink/Sources/Counter Free-Running'};
    % 10 13
    % 11 13
    % 12 13
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 16 17
    desc = struct('ShortListing', 'CounterFreeRunning Source VHDL emission', 'HelpText', 'CounterFreeRunning source code generation via direct VHDL emission');
    % 18 21
    % 19 21
    % 20 21
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 22 23
end % function
