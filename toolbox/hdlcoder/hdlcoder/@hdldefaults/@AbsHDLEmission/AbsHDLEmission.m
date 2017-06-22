function this = AbsHDLEmission(block)
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
    this = hdldefaults.AbsHDLEmission;
    % 20 21
    supportedBlocks = {'built-in/Abs','simulink/Math Operations/Abs'};
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 29 30
    desc = struct('ShortListing', 'HDL emission', 'HelpText', 'Abs code generation via direct HDL emission');
    % 31 34
    % 32 34
    % 33 34
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 35 36
end % function
