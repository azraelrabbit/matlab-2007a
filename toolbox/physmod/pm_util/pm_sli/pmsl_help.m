function link = pmsl_help(block)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    d = docroot;
    % 11 13
    if isempty(d)
        % 13 15
        directory = fileparts(which(mfilename));
        link = fullfile(directory, 'pmsl_herr.html');
    else
        % 17 20
        % 18 20
        link = pmsl_defaultdocumentation;
        if gt(nargin, 0.0)
            link = lHandleSpecialBlockLink(block);
            if isempty(link)
                % 23 25
                entry = pmsl_getblocklibraryentry(block);
                if ~(isempty(entry))
                    link = entry.getDocumentation(block);
                end
                % 28 30
            end
        end
        % 31 33
        link = horzcat(d, '/', link);
        % 33 35
    end
    % 35 37
end
function link = lHandleSpecialBlockLink(block_hdl)
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    link = '';
    blockType = '';
    slld = sllastdiagnostic;
    lastErr = lasterror;
    % 49 51
    map = struct('TwoWayConnection', 'twowayconnection.html', 'PMIOPort', 'connectionport.html');
    % 51 54
    % 52 54
    try
        blockType = get_param(block_hdl, 'BlockType');
    catch
        blockType = '';
        sllastdiagnostic(slld);
        lasterror(lastErr);
    end % try
    % 60 62
    if ~(isempty(blockType)) && isfield(map, blockType)
        [dummy, referenceRoot] = pmsl_defaultdocumentation;
        link = horzcat(referenceRoot, '/', map.(blockType));
    end
    % 65 67
end
