function blocks = getBlocksFromImplementation(this, implementation)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    blocks = {};
    fn = fieldnames(this.BlockDB);
    for ii=1.0:length(fn)
        entry = this.BlockDB.(fn{ii});
        if any(strcmpi(entry.Implementations, implementation))
            if isempty(blocks)
                blocks = cellhorzcat(entry.SimulinkPath);
            else
                blocks = cat(1.0, blocks, cellhorzcat(entry.SimulinkPath));
            end
        end
    end % for
end
