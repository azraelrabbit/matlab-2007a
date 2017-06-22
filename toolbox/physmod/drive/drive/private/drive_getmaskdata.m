function maskdata = drive_getmaskdata(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    wsvariables = get_param(block, 'MaskWSVariables');
    maskdata = struct;
    for i=1.0:length(wsvariables)
        maskdata.(wsvariables(i).Name) = wsvariables(i).Value;
    end % for
end
