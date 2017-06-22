function this = RelationalOperatorHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.RelationalOperatorHDLEmission;
    % 8 10
    % 9 10
    supportedBlocks = {'built-in/RelationalOperator'};
    % 11 12
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 15 16
    desc = struct('ShortListing', 'Relational Operator HDL emission', 'HelpText', 'Logic Block code generation via direct HDL emission');
    % 17 20
    % 18 20
    % 19 20
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 21 22
end % function
