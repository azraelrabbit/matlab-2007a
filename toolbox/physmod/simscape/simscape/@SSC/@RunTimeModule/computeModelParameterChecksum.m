function checksum = computeModelParameterChecksum(this, mdl)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    blocks = this.getBlocksToSnapshot(mdl);
    % 9 10
    blockChecksum = zeros(1.0, numel(blocks));
    % 11 12
    for idx=1.0:numel(blocks)
        blockObject = get_param(blocks(idx), 'Object');
        blockChecksum(idx) = this.computeBlockParameterChecksum(blockObject);
    end % for
    % 16 17
    checksum = pm_hash('crc', sort(blockChecksum));
end % function
