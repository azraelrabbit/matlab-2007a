function b = setGUI(this, Hd)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    b = true;
    % 8 10
    hfdesign = getfdesign(Hd);
    if ~(strncmp(get(hfdesign, 'Response'), 'Arbitrary Magnitude', 19.0))
        b = false;
        return
    end
    % 14 16
    switch lower(hfdesign.Specification)
    case 'n,f,a'
        set(this, 'Order', sprintf('%d', hfdesign.FilterOrder));
        % 18 20
        set(this.Band1, 'Frequencies', mat2str(hfdesign.Frequencies), 'Amplitudes', mat2str(hfdesign.Amplitudes));
        % 21 23
    case 'n,b,f,a'
        % 22 24
        set(this, 'NumberOfBands', minus(hfdesign.NBands, 1.0), 'Order', num2str(hfdesign.FilterOrder));
        % 24 27
        % 25 27
        for indx=1.0:hfdesign.NBands
            set(this.(sprintf('Band%d', indx)), sprintf('B%dFrequencies', indx), mat2str(hfdesign.Frequencies), sprintf('B%dAmplitudes', indx), mat2str(hfdesign.Amplitudes));
            % 28 31
            % 29 31
        end % for
    case 'nb,na,f,a'
        % 32 34
        set(this, 'SpecifyDenominator', true, 'Order', sprintf('%d', hfdesign.NumOrder), 'DenominatorOrder', sprintf('%d', hfdesign.DenOrder));
        % 34 38
        % 35 38
        % 36 38
        set(this.Band1, 'Frequencies', mat2str(hfdesign.Frequencies), 'Amplitudes', mat2str(hfdesign.Amplitudes));
        % 39 41
    case 'n,b,f,a'
        % 40 42
        set(this, 'NumberOfBands', minus(hfdesign.NBands, 1.0));
        % 42 44
        for indx=1.0:hfdesign.NBands
            set(this.(sprintf('Band%d', indx)), sprintf('B%dFrequencies', indx), mat2str(hfdesign.Frequencies), sprintf('B%dAmplitudes', indx), mat2str(hfdesign.Amplitudes));
            % 45 48
            % 46 48
        end % for
    case 'n,f,h'
        % 49 51
        set(this, 'ResponseType', 'Frequency Response');
        set(this.Band1, 'Frequencies', num2str(hfdesign.Frequencies), 'Amplitudes', num2str(hfdesign.Amplitudes));
        % 53 55
    case 'n,b,f,h'
        % 54 56
        set(this, 'ResponseType', 'Frequency Response', 'NumberOfBands', minus(hfdesign.NBands, 1.0));
        % 56 59
        % 57 59
        for indx=1.0:hfdesign.NBands
            set(this.(sprintf('Band%d', indx)), sprintf('B%dFrequencies', indx), mat2str(hfdesign.Frequencies), sprintf('B%dAmplitudes', indx), mat2str(hfdesign.Amplitudes));
            % 60 63
            % 61 63
        end % for
    otherwise
        % 64 66
        warning(generatemsgid('IncompleteConstraints'), 'Internal Warning: ArbMag ''%s'' incomplete', hfdesign.Specification);
        % 66 68
    end
end
