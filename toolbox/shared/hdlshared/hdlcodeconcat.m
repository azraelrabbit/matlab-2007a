function hdlcode = hdlcodeconcat(hdlcodein)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if isempty(hdlcodein)
        hdlcode = [];
    else
        fnames = fieldnames(hdlcodein);
        % 12 14
        for n=1.0:length(fnames)
            fn = fnames{n};
            hdlcode.(fn) = horzcat(hdlcodein(:).(fn));
        end % for
    end
end
