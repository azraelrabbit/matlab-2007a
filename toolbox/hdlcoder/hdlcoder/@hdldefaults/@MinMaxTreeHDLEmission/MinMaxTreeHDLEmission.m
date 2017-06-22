function this = MinMaxTreeHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.MinMaxTreeHDLEmission;
    % 8 10
    % 9 10
    supportedBlocks = {'dspstat3/Minimum','dspstat3/Maximum','built-in/MinMax'};
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 19 20
    desc = struct('ShortListing', 'DSP/built-in  Minimum/Maximum Tree architecture HDL emission', 'HelpText', 'DSP/built-in  Minimum/Maximum code generation via direct HDL emission (Tree Architecture)');
    % 21 24
    % 22 24
    % 23 24
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 25 26
end % function
