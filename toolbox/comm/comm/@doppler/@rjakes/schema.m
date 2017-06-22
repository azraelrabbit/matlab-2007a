function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pk = findpackage('doppler');
    % 9 12
    % 10 12
    c = schema.class(pk, 'rjakes', findclass(pk, 'baseclass'));
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    p = schema.prop(c, 'FreqMinMaxRJakes', 'double_vector');
    p.FactoryValue = [0.0 1.0];
    p.Description = 'Vector of minimum and maximum normalized Doppler frequencies';
    p.SetFunction = @setFreqMinMaxRJakes;
end % function
function freqMinMaxRJakes = setFreqMinMaxRJakes(h, freqMinMaxRJakes)
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    [nrows, ncolumns] = size(freqMinMaxRJakes);
    if ne(nrows, 1.0) || ne(ncolumns, 2.0) || not(isnumeric(freqMinMaxRJakes)) || not(isreal(freqMinMaxRJakes)) || any(isnan(freqMinMaxRJakes)) || any(isinf(freqMinMaxRJakes)) || any(lt(freqMinMaxRJakes, 0.0)) || any(gt(freqMinMaxRJakes, 1.0))
        % 36 40
        % 37 40
        % 38 40
        error(horzcat(getErrorId(h), ':InvalidFreqMinMaxRJakes'), 'FreqMinMaxRJakes must be a row vector of 2 finite real numbers between 0 and 1.');
        % 40 43
        % 41 43
    end % if
    % 43 45
    if gt(freqMinMaxRJakes(1.0), freqMinMaxRJakes(2.0))
        error(horzcat(getErrorId(h), ':InvalidFreqMinRJakesTooHigh'), 'The minimum frequency must be must be smaller than or equal to the maximum frequency.');
        % 46 49
        % 47 49
    end % if
end % function
