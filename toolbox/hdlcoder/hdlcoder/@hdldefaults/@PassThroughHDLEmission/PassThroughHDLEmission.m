function this = PassThroughHDLEmission(block)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    this = hdldefaults.PassThroughHDLEmission;
    % 20 21
    supportedBlocks = {'dspsigattribs/Convert 1-D to 2-D','built-in/SignalConversion','simulink/Math Operations/Reshape','built-in/Reshape'};
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 31 32
    desc = struct('ShortListing', 'HDL emission', 'HelpText', 'Pass-through code generation via direct HDL emission');
    % 33 36
    % 34 36
    % 35 36
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 37 38
end % function
