function errmsg = validateChanges(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    errmsg = '';
    % 10 12
    % 11 12
    try
        lpf = eval(this.lpf);
        [numRowsLPF, numColsLPF] = size(lpf);
        if ne(numRowsLPF, 1.0) && ne(numColsLPF, 1.0)
            errmsg = 'Lowpass FIR filter coefficients must be a non-empty vector';
            return;
        end % if
        % 19 22
        % 20 22
        % 21 22
    end % try
    % 23 25
    % 24 25
    try
        hpf = eval(this.hpf);
        [numRowsHPF, numColsHPF] = size(hpf);
        if ne(numRowsHPF, 1.0) && ne(numColsHPF, 1.0)
            errmsg = 'Highpass FIR filter coefficients must be a non-empty vector';
            return;
        end % if
        % 32 35
        % 33 35
        % 34 35
    end % try
    % 36 37
    if isempty(errmsg)
        errmsg = this.FixptDialog.validateChanges;
    end % if
end % function
