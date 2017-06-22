function this = FrameConversionHDLEmission(block)
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
    this = hdldefaults.FrameConversionHDLEmission;
    % 12 13
    supportedBlocks = {'built-in/FrameConversion'};
    % 14 17
    % 15 17
    % 16 17
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 20 21
    desc = struct('ShortListing', 'Frame Conversion HDL emission', 'HelpText', 'Frame Conversion code generation via direct HDL emission');
    % 22 25
    % 23 25
    % 24 25
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 26 27
end % function
