function this = IncisiveHDLInstantiation(block)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    this = hdlincisive.IncisiveHDLInstantiation;
    % 12 13
    supportedBlocks = {'lfilinklib/HDL Cosimulation'};
    % 14 15
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 18 20
    % 19 20
    desc = struct('ShortListing', 'Incisive HDL instantiation', 'HelpText', 'Incisive code generation via direct HDL instantiation');
    % 21 24
    % 22 24
    % 23 24
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'CodeGenMode', 'vhdlinstantiation', 'Description', desc);
    % 25 27
    % 26 27
end % function
