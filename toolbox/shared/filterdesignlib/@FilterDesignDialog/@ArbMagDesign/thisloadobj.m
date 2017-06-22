function thisloadobj(this, s)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    set(this, 'SpecifyDenominator', s.SpecifyDenominator, 'DenominatorOrder', s.DenominatorOrder, 'NumberOfBands', s.NumberOfBands, 'ResponseType', s.ResponseType);
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    indx = 1.0;
    bandprop = sprintf('Band%d', indx);
    while ~(isempty(s.(bandprop)))
        this.(bandprop) = s.(bandprop);
        indx = plus(indx, 1.0);
        bandprop = sprintf('Band%d', indx);
    end % while
end
