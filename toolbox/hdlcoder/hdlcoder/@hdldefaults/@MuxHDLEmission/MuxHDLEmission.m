function this = MuxHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.MuxHDLEmission;
    % 8 10
    % 9 10
    supportedBlocks = {'built-in/Mux','built-in/Concatenate'};
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 18 19
    desc = struct('ShortListing', 'Mux HDL emission', 'HelpText', 'Mux code generation via direct HDL emission');
    % 20 23
    % 21 23
    % 22 23
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 24 25
end % function
