function this = StateflowHDLInstantiation(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdlstateflow.StateflowHDLInstantiation;
    % 8 9
    supportedBlocks = {'sflib/Chart','eml_lib/Embedded MATLAB Function'};
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 17 18
    desc = struct('ShortListing', 'Stateflow HDL instantiation', 'HelpText', 'Stateflow code generation via HDL instantiation');
    % 19 22
    % 20 22
    % 21 22
    this.init('SupportedBlocks', supportedBlocks, 'Block', block, 'CodeGenMode', 'vhdlinstantiation', 'CodeGenFunc', 'emit', 'CodeGenParams', [], 'HandleType', 'useobjandcomphandles', 'Description', desc);
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
end % function
