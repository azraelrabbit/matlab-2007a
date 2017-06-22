function this = ZeroOrderHoldHDLEmission(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = hdldefaults.ZeroOrderHoldHDLEmission;
    % 11 12
    supportedBlocks = {'built-in/ZeroOrderHold'};
    % 13 16
    % 14 16
    % 15 16
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 19 20
    desc = struct('ShortListing', 'Zero Order Hold HDL emission', 'HelpText', 'Zero Order Hold code generation via direct HDL emission');
    % 21 24
    % 22 24
    % 23 24
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 25 26
end % function
