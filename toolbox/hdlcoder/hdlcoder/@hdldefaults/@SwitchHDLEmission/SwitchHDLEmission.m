function this = SwitchHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.SwitchHDLEmission;
    % 8 10
    % 9 10
    supportedBlocks = {'built-in/Switch'};
    % 11 14
    % 12 14
    % 13 14
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 17 18
    desc = struct('ShortListing', 'Switch HDL emission', 'HelpText', 'Switch code generation via direct HDL emission');
    % 19 22
    % 20 22
    % 21 22
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 23 24
end % function
