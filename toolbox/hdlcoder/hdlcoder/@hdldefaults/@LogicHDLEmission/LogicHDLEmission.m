function this = LogicHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.LogicHDLEmission;
    % 8 10
    % 9 10
    supportedBlocks = {'built-in/Logic'};
    % 11 12
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 15 16
    desc = struct('ShortListing', 'Logic HDL emission', 'HelpText', 'Logic Block code generation via direct HDL emission');
    % 17 20
    % 18 20
    % 19 20
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 21 22
end % function
