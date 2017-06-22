function loadFromBlock(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if ~(isempty(this.Block))
        for ind=1.0:length(this.PropNames)
            if strcmp(this.PropTypes{ind}, 'bool')
                this.(this.PropNames{ind}) = strcmpi(this.Block.(this.PropNames{ind}), 'on');
            else
                % 12 14
                this.(this.PropNames{ind}) = this.Block.(this.PropNames{ind});
            end
        end % for
    end
end
