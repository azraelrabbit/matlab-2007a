function freq = frequency(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    maxlen = get(h, 'MaxLength');
    ts = get(h, 'Ts');
    fc = get(h, 'Fc');
    % 13 15
    % 14 15
    ifftlen = mpower(2.0, ceil(log2(maxlen)));
    % 16 18
    % 17 18
    freq = plus(mrdivide(mtimes(mrdivide(uminus(ifftlen), 2.0):minus(mrdivide(ifftlen, 2.0), 1.0), mrdivide(1.0, ts)), ifftlen), fc);
    % 19 21
    % 20 21
    if any(le(freq, 0.0))
        id = 'rfblks:rfbbequiv:rfbbequiv:frequency:WrongInputsToInputPort';
        if isempty(h.Block)
            error(id, '%s: The bandwidth of the filter determined by the sample time \nis too large compared to the specified center frequency.', h.Name);
        else
            error(id, 'The bandwidth of the filter determined by the sample time is too large compared to the specified center frequency.');
        end % if
    end % if
end % function
