function this = DataTypeConversionHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.DataTypeConversionHDLEmission;
    % 8 10
    % 9 10
    supportedBlocks = {'built-in/DataTypeConversion'};
    % 11 14
    % 12 14
    % 13 14
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 17 18
    desc = struct('ShortListing', 'Data Type Conversion HDL emission', 'HelpText', 'Data Type Conversion code generation via direct HDL emission');
    % 19 22
    % 20 22
    % 21 22
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 23 24
end % function
