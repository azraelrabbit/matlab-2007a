function dispDatabase(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    disp(sprintf('---------------------------'));
    disp(sprintf('HDL Implementation database'));
    disp(sprintf('---------------------------\n'));
    % 9 11
    if isempty(this.BlockDB)
        disp('EMPTY')
    else
        blocks = sort(fieldnames(this.BlockDB));
        for ii=1.0:length(blocks)
            dbEntry = this.BlockDB.(blocks{ii});
            slBlkPath = dbEntry.SimulinkPath;
            % 17 19
            slBlkPath = regexprep(slBlkPath, '\n', ' ');
            disp(sprintf('Block: ''%s''', slBlkPath));
            % 20 22
            for jj=1.0:length(dbEntry.Implementations)
                impl = dbEntry.Implementations{jj};
                descTag = hdllegalizefieldname(impl);
                disp(sprintf('  Implementation: ''%s''', impl));
                disp(sprintf('     Description: ''%s''', this.DescriptionDB.(descTag).ShortListing))
                % 26 28
            end % for
            disp(' ');
        end % for
    end
end
