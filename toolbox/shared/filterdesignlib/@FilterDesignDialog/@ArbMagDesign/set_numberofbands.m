function numberofbands = set_numberofbands(this, numberofbands)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    oldNBands = this.NumberOfBands;
    % 8 10
    set(this, 'privNumberOfBands', numberofbands);
    % 10 13
    % 11 13
    for indx=plus(oldNBands, 1.0):numberofbands
        bandProp = sprintf('Band%d', plus(indx, 1.0));
        if isempty(this.(bandProp))
            this.(bandProp) = FilterDesignDialog.ArbMagBand;
        end
    end % for
    % 18 20
    updateMethod(this);
end
