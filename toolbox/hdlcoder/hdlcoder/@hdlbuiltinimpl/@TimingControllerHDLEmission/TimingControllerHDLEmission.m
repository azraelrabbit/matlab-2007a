function this = TimingControllerHDLEmission(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = hdlbuiltinimpl.TimingControllerHDLEmission;
    % 10 11
    magicClockDriverBlockImplTags = 'PirTimingController';
    % 12 13
    supportedBlocks = cellhorzcat(magicClockDriverBlockImplTags);
    % 14 17
    % 15 17
    % 16 17
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 20 22
    % 21 22
    desc = struct('ShortListing', 'Default Timing Controller Internal Implementation', 'HelpText', 'Default Timing Controller code generation via direct HDL emission');
    % 23 26
    % 24 26
    % 25 26
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'CodeGenMode', 'vhdlemission', 'CodeGenFunc', 'emit', 'CodeGenParams', [], 'HandleType', 'useobjandcomphandles', 'Description', desc);
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
end % function
