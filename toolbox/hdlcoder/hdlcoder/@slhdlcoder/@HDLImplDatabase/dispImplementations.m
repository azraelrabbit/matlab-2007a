function dispImplementations(this, showBlks)
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
    if lt(nargin, 2.0)
        showBlocks = false;
    else
        if ischar(showBlks) && strcmp(showBlks, 'showblocks')
            showBlocks = true;
        else
            error(horzcat(this.MessageID, 'invalidDisplayArgument'), 'Invalid input argument; expected the string ''showblocks''');
            % 21 23
        end
    end
    % 24 26
    disp(' ')
    % 26 28
    if isempty(this.DescriptionDB)
        disp('NONE')
    else
        if ~(showBlocks)
            disp('Implementations:')
            disp(' ')
        end
        % 34 36
        impls = sort(fieldnames(this.DescriptionDB));
        for ii=1.0:length(impls)
            dbEntry = this.DescriptionDB.(impls{ii});
            implName = dbEntry.ClassName;
            blocks = sort(dbEntry.SupportedBlocks);
            if showBlocks
                disp(sprintf('Implementation: ''%s''', implName))
                disp('  Supported blocks:')
                disp(blocks);
            else
                disp(sprintf('    ''%s''', implName));
            end
        end % for
    end
    % 49 51
    disp(' ')
end
