function this = MemoryHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.MemoryHDLEmission;
    % 8 9
    supportedBlocks = {'built-in/Memory'};
    % 10 13
    % 11 13
    % 12 13
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 16 17
    desc = struct('ShortListing', 'Memory HDL emission', 'HelpText', 'Memory code generation via direct HDL emission');
    % 18 21
    % 19 21
    % 20 21
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 22 23
end % function
