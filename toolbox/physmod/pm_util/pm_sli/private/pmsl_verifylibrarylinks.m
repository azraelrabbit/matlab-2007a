function blockList = pmsl_verifylibrarylinks(mdl)
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
    if not(isa(mdl, 'Simulink.BlockDiagram'))
        mdl = get_param(mdl, 'Object');
    end % if
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    physicalDomainBlocks = find_system(mdl.Handle, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'regexp', 'on', 'PhysicalDomain', '.');
    % 24 25
    linkStatus = get_param(physicalDomainBlocks, 'LinkStatus');
    idx = or(or(strcmp(linkStatus, 'inactive'), strcmp(linkStatus, '')), strcmp(linkStatus, 'none'));
    blockList = physicalDomainBlocks(idx);
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    domains = get_param(blockList, 'PhysicalDomain');
    blocksInNeDomain = blockList(strcmpi(domains, 'network_engine_domain'));
    blocksInMechDomain = blockList(strcmpi(domains, 'mechanical'));
    blocksInDriveDomain = blockList(strcmpi(domains, 'driveline_domain'));
    % 42 57
    % 43 57
    % 44 57
    % 45 57
    % 46 57
    % 47 57
    % 48 57
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    neBlockType = get_param(blocksInNeDomain, 'BlockType');
    pmComponentIdx = strcmp(neBlockType, 'PMComponent');
    pmComponentBlocks = blocksInNeDomain(pmComponentIdx);
    topLevelPmComponentNeBlocks = cell2mat(get_param(get_param(pmComponentBlocks, 'Parent'), 'Handle'));
    topLevelNonPmComponentNeBlocks = blocksInNeDomain(not(pmComponentIdx));
    % 62 65
    % 63 65
    % 64 65
    blocksWithBrokenLinks = vertcat(blocksInMechDomain, blocksInDriveDomain, topLevelNonPmComponentNeBlocks, topLevelPmComponentNeBlocks);
    % 66 68
    % 67 68
    blockList = pm_sanitize_name(getfullname(unique(blocksWithBrokenLinks)));
    % 69 70
    if not(iscell(blockList))
        blockList = cellhorzcat(blockList);
        return;
    end % if
    % 74 75
    blockList = sort(blockList);
end % function
