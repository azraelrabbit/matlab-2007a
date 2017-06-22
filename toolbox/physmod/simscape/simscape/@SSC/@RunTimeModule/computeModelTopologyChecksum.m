function checksum = computeModelTopologyChecksum(this, mdl)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hashFn = ssc_private('ssc_model_topology_hash');
    checksum = hashFn(mdl);
end % function
