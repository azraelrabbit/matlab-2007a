function this = SignalSpecificationHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.SignalSpecificationHDLEmission;
    % 8 10
    % 9 10
    supportedBlocks = {'built-in/SignalSpecification','simulink/Signal Attributes/Signal Specification'};
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 18 19
    desc = struct('ShortListing', 'Signal Specification HDL emission', 'HelpText', 'Signal Specification code generation via direct HDL emission');
    % 20 23
    % 21 23
    % 22 23
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 24 25
end % function
