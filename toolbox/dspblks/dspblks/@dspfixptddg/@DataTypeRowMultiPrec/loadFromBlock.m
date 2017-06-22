function loadFromBlock(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    mode = this.Block.(horzcat(this.Prefix, 'Mode'));
    if strcmp(mode, 'User-defined')
        this.Mode = 'Binary point scaling';
    else
        if strcmp(mode, 'Same as input') && ~(any(strcmp(this.Entries, 'Same as input')))
            this.Mode = 'Same word length as input';
        else
            if strcmp(mode, 'Same as numerator') && ~(any(strcmp(this.Entries, 'Same as numerator')))
                this.Mode = 'Same word length as numerator';
            else
                this.Mode = mode;
            end
        end
    end
    this.WordLength = this.Block.(horzcat(this.Prefix, 'WordLength'));
    for i=1.0:this.NumPrecs
        this.(this.PropNames{i}) = this.Block.(this.MaskPropNames{i});
    end % for
end
