function this = ConstantHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.ConstantHDLEmission;
    % 8 9
    supportedBlocks = {'built-in/Constant','built-in/Ground','dspsrcs4/DSP Constant'};
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 18 19
    desc = struct('ShortListing', 'Constant Source HDL emission', 'HelpText', 'Constant source code generation via direct HDL emission');
    % 20 23
    % 21 23
    % 22 23
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 24 25
end % function
