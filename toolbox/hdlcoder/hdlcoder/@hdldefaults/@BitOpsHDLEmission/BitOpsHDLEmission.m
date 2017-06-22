function this = BitOpsHDLEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdldefaults.BitOpsHDLEmission;
    % 8 9
    supportedBlocks = {'simulink/Logic and Bit Operations/Shift Arithmetic','simulink/Logic and Bit Operations/Bit Set','simulink/Logic and Bit Operations/Bit Clear','simulink/Logic and Bit Operations/Bitwise Operator'};
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 19 20
    desc = struct('ShortListing', 'Bitwise operators HDL emission', 'HelpText', 'Bitwise operators code generation via direct HDL emission');
    % 21 24
    % 22 24
    % 23 24
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'Description', desc);
    % 25 26
end % function
