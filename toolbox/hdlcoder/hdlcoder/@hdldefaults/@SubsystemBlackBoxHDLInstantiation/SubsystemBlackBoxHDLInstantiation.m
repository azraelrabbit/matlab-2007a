function this = SubsystemBlackBoxHDLInstantiation(block)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    this = hdldefaults.SubsystemBlackBoxHDLInstantiation;
    % 12 13
    supportedBlocks = {'built-in/SubSystem'};
    % 14 17
    % 15 17
    % 16 17
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 20 22
    % 21 22
    desc = struct('ShortListing', 'Subsystem BlackBox HDL instantiation', 'HelpText', 'Instantiate Builtin Subsytems without recursively doing codegeneration');
    % 23 26
    % 24 26
    % 25 26
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'CodeGenMode', 'vhdlinstantiation', 'Description', desc);
    % 27 29
    % 28 29
end % function
