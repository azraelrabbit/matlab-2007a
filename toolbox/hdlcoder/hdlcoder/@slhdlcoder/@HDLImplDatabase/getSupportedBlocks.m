function blocks = getSupportedBlocks(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if isempty(this.BlockDB)
        error(horzcat(this.MessageID, 'invalidDatabase'), 'Please build Database before calling getSupportedBlocks method');
        % 10 12
    end
    % 12 14
    fn = fieldnames(this.BlockDB);
    blocks = cell(length(fn), 1.0);
    for ii=1.0:length(fn)
        blocks{ii} = this.BlockDB.(fn{ii}).SimulinkPath;
    end % for
    % 18 20
    blocks = sort(blocks);
end
