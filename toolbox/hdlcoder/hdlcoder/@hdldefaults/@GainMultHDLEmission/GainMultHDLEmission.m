function this = GainMultHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.GainMultHDLEmission;
    % 8 10
    % 9 10
    supportedBlocks = 'built-in/Gain';
    % 11 12
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 15 16
    desc = struct('ShortListing', 'Multiply HDL emission', 'HelpText', 'Gain multiply code generation via direct HDL emission');
    % 17 20
    % 18 20
    % 19 20
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 21 22
end % function
