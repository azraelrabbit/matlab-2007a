function [pmBlockHandles, topLevelPmBlocksFlags, products] = ssc_get_pm_blocks(mdl)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 10 12
    % 11 12
    if not(isa(mdl, 'Simulink.BlockDiagram'))
        mdl = get_param(mdl, 'Object');
    end % if
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    blocksWithBrokenLink = pmsl_validatelibrarylinks(mdl);
    if not(isempty(blocksWithBrokenLink))
        pm_error('platform:SSC:ssc_get_pm_blocks:BrokenLink', blocksWithBrokenLink);
    end % if
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    if eq(nargout, 3.0)
        [pmBlockHandles, topLevelPmBlocksFlags, products] = lFindPmBlocks(mdl);
    else
        [pmBlockHandles, topLevelPmBlocksFlags] = lFindPmBlocks(mdl);
    end % if
end % function
function [pmBlockHandles, topLevelPmBlocksFlags, products] = lFindPmBlocks(mdl)
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    getProducts = false;
    if eq(nargout, 3.0)
        getProducts = true;
    end % if
    % 47 48
    pmLibraries = {};
    blocks = sort(ssc_gettoplevelblocks(mdl));
    libDb = PmSli.LibraryDatabase;
    libraryBlocks = get_param(blocks, 'ReferenceBlock');
    % 52 54
    % 53 54
    regexpPattern = '^([^/]+)(/.+)';
    libraryNames = regexprep(libraryBlocks, regexpPattern, '$1');
    if not(iscell(libraryNames))
        libraryNames = cellhorzcat(libraryNames);
    end % if
    pmBlockIdx = libDb.containsEntry(libraryNames);
    pmBlocks = blocks(pmBlockIdx);
    pmLibraries = cellhorzcat(pmLibraries{:}, libraryNames{pmBlockIdx});
    % 62 64
    % 63 64
    unknownBlocks = blocks(not(pmBlockIdx));
    % 65 68
    % 66 68
    % 67 68
    possiblePmBlocks = unknownBlocks;
    pmSsIdx = false(1.0, numel(possiblePmBlocks));
    for idx=1.0:numel(possiblePmBlocks)
        childBlocks = find_system(possiblePmBlocks(idx), 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'LinkStatus', 'resolved', 'BlockType', 'SubSystem');
        % 72 73
        childReferenceBlocks = get_param(childBlocks, 'ReferenceBlock');
        % 74 76
        % 75 76
        childLibraryNames = regexprep(childReferenceBlocks, regexpPattern, '$1');
        childLibraryIdx = libDb.containsEntry(childLibraryNames);
        pmSsIdx(idx) = any(childLibraryIdx);
        if pmSsIdx(idx)
            pmLibraries = cellhorzcat(pmLibraries{:}, childLibraryNames{childLibraryIdx});
        end % if
    end % for
    % 83 84
    pmSubsystemBlocks = possiblePmBlocks(pmSsIdx);
    % 85 87
    % 86 87
    pmBlockHandles = vertcat(pmBlocks, pmSubsystemBlocks);
    topLevelPmBlocksFlags = vertcat(true(numel(pmBlocks), 1.0), false(numel(pmSubsystemBlocks), 1.0));
    % 89 91
    % 90 91
    products = {};
    % 92 93
    if getProducts
        % 94 97
        % 95 97
        % 96 97
        pmLibraries = unique(pmLibraries);
        pmLibraryEntries = libDb.getLibraryEntry(pmLibraries);
        numLibraries = numel(pmLibraries);
        products = cell(1.0, numLibraries);
        for idx=1.0:numLibraries
            products{idx} = pmLibraryEntries(idx).Product;
        end % for
        % 104 105
        products = unique(products);
    end % if
end % function
