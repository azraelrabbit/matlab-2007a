function this = RateTransitionHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.RateTransitionHDLEmission;
    % 8 10
    % 9 10
    supportedBlocks = {'built-in/RateTransition'};
    % 11 14
    % 12 14
    % 13 14
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 17 18
    desc = struct('ShortListing', 'Rate Transition HDL emission', 'HelpText', 'Rate Transition code generation via direct HDL emission');
    % 19 22
    % 20 22
    % 21 22
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 23 24
end % function
