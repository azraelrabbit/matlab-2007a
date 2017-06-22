function desc = getDescriptionsFromBlock(this, block)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    tag = hdllegalizefieldname(block);
    if isfield(this.BlockDB, tag)
        impls = this.BlockDB.(tag).Implementations;
        for ii=1.0:length(impls)
            descTag = hdllegalizefieldname(impls{ii});
            desc(ii) = this.DescriptionDB.(descTag);
        end % for
    end
end
