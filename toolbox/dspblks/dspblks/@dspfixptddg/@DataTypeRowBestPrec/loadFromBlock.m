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
            this.Mode = mode;
        end
    end
    this.WordLength = this.Block.(horzcat(this.Prefix, 'WordLength'));
    this.FracLength = this.Block.(horzcat(this.Prefix, 'FracLength'));
    this.FracLengthEdit = this.Block.(horzcat(this.Prefix, 'FracLength'));
end
