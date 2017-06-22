function s = ploadqfilt(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    s = load(varargin{:});
    % 8 10
    w = fieldnames(s);
    % 10 12
    for indx=1.0:length(w)
        if isa(s.(w{indx}), 'qfilt')
            disp(sprintf('Converting %s to a DFILT object.', w{indx}));
            s.(w{indx}) = dfilt(s.(w{indx}));
        end
    end % for
end
