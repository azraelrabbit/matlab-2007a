function this = ProductCascadeHDLEmission(block)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    this = hdldefaults.ProductCascadeHDLEmission;
    % 20 21
    supportedBlocks = {'built-in/Product'};
    % 22 25
    % 23 25
    % 24 25
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 28 29
    desc = struct('ShortListing', 'VHDL emission of Cascade Arctitecture of Product', 'HelpText', 'Product (cascade architecture) code generation via direct VHDL emission');
    % 30 33
    % 31 33
    % 32 33
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 34 35
end % function
