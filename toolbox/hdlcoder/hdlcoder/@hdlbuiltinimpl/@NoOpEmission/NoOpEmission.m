function this = NoOpEmission(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdlbuiltinimpl.NoOpEmission;
    % 8 9
    if eq(nargin, 0.0)
        block = '';
    end % if
    % 12 13
    desc = struct('ShortListing', 'No Op', 'HelpText', 'Do Nothing');
    % 14 17
    % 15 17
    % 16 17
    this.init('SupportedBlocks', 'all', 'CodeGenMode', 'vhdlemission', 'HandleType', 'useobjandcomphandles', 'Description', desc);
    % 18 20
    % 19 20
end % function
