function s = thissaveobj(this, s)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    s.SpecifyDenominator = get(this, 'SpecifyDenominator');
    s.DenominatorOrder = get(this, 'DenominatorOrder');
    s.NumberOfBands = get(this, 'NumberOfBands');
    s.ResponseType = get(this, 'ResponseType');
    % 11 13
    for indx=1.0:10.0
        bandprop = sprintf('Band%d', indx);
        s.(bandprop) = get(this, bandprop);
    end % for
end
