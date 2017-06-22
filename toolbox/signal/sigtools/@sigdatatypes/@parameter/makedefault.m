function makedefault(hPrm, tool, defaults)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    error(nargchk(2.0, 3.0, nargin));
    % 12 14
    prefs = [];
    if ispref('SignalProcessingToolbox', 'DefaultParameters')
        prefs = getpref('SignalProcessingToolbox', 'DefaultParameters');
    end
    % 17 19
    pstruct = param2struct(hPrm);
    if gt(nargin, 2.0)
        % 20 22
        if ne(length(defaults), length(hPrm))
            error('Defaults must be the same length as the parameters.');
        end
        % 24 26
        fnames = fieldnames(pstruct);
        for i=1.0:length(fnames)
            pstruct.(fnames{i}) = defaults{i};
        end % for
    end
    % 30 32
    if isfield(prefs, tool)
        prefs.(tool) = setstructfields(prefs.(tool), pstruct);
    else
        prefs.(tool) = pstruct;
    end
    % 36 38
    setpref('SignalProcessingToolbox', 'DefaultParameters', prefs);
end
