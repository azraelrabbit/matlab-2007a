function out = closeSection(this)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    this.RuntimeSerializer.closeRootElement;
    % 11 13
    if not(this.RuntimeSerializer.wasContentWritten)
        % 13 19
        % 14 19
        % 15 19
        % 16 19
        % 17 19
        this.status(sprintf('"%s" contains no content and will not be inserted into document', this.RuntimeSectionType), 2.0);
        % 19 22
        % 20 22
        out = [];
    else
        if not(isempty(this.RuntimeRelativeFileName))
            refName = sprintf('sect-%0.3i', this.RuntimeSectionIndex);
            adRG = rptgen.appdata_rg;
            out = adRG.addEntityDefinition(refName, this.RuntimeRelativeFileName);
        else
            % 28 30
            out = [];
        end % if
        % 31 33
    end % if
    this.RuntimeSectionType = '';
    this.RuntimeSerializer = [];
    this.RuntimeRelativeFileName = '';
    this.RuntimeSectionIndex = 0.0;
end % function
