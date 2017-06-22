function dupName = checkForDuplicateShortListing(this, curImpls, description)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if ~(iscell(curImpls))
        curImpls = cellhorzcat(curImpls);
    end
    % 11 13
    dupName = '';
    for ii=1.0:length(curImpls)
        curImpl = curImpls{ii};
        descTag = hdllegalizefieldname(curImpl);
        if strcmp(this.DescriptionDB.(descTag).ShortListing, description.ShortListing)
            % 17 19
            dupName = curImpl;
            break
        end
    end % for
end
