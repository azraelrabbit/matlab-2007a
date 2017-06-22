function this = SignumHDLEmission(block)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    this = hdldefaults.SignumHDLEmission;
    % 16 17
    supportedBlocks = {'built-in/Signum'};
    % 18 19
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 22 23
    desc = struct('ShortListing', 'HDL emission', 'HelpText', 'Sign block code generation via direct HDL emission');
    % 24 27
    % 25 27
    % 26 27
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 28 29
end % function
