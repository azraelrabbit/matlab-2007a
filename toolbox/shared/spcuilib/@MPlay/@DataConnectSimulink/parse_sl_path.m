function [lineh, porth, blkh, portIdx] = parse_sl_path(H, sl_path)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    lineh = [];
    porth = [];
    blkh = [];
    portIdx = [];
    if ischar(sl_path)
        fullblk = sl_path;
        portIdx = 1.0;
        blkh = get_param(fullblk, 'handle');
    else
        if iscell(sl_path)
            % 34 37
            % 35 37
            inEle = numel(sl_path);
            if lt(inEle, 1.0) || gt(inEle, 2.0)
                error('Incorrect number of entries in cell-array');
            end
            firstIn = sl_path{1.0};
            if isempty(firstIn)
                return
            end
            if isa(firstIn, 'double')
                lineh = firstIn;
                [lineh, porth, blkh, portIdx] = convert_line_to_blk(lineh);
            else
                if isa(firstIn, 'char')
                    blkh = get_param(firstIn, 'handle');
                    if eq(inEle, 2.0)
                        portIdx = sl_path{2.0};
                        if not(isscalar(portIdx)) || not(isa(portIdx, 'double'))
                            error('Port number must be a scalar double');
                        end
                    else
                        portIdx = 1.0;
                    end
                else
                    % 59 61
                    error('Invalid path specified');
                end
            end
        else
            if isa(sl_path, 'double')
                % 65 67
                if isempty(sl_path)
                    return
                end
                lineh = sl_path;
                [lineh, porth, blkh, portIdx] = convert_line_to_blk(lineh);
            else
                error('Invalid path specified');
            end
        end
    end
    if isempty(lineh)
        all_porth = get_param(blkh, 'PortHandles');
        nports = numel(all_porth.Outport);
        if gt(portIdx, nports) || lt(portIdx, 1.0)
            error('Invalid port index: must be from 1 to %d', nports);
        end
        lineh = get_param(all_porth.Outport(portIdx), 'Line');
        porth = get(lineh, 'SrcPortHandle');
    end
end
function [lineh, porth, blkh, portIdx] = convert_line_to_blk(lineh)
    % 87 90
    % 88 90
    N = numel(lineh);
    porth = zeros(N, 1.0);
    blkh = porth;
    portIdx = porth;
    lineh = lineh(:);
    for i=1.0:N
        porth(i, 1.0) = get(lineh(i), 'SrcPortHandle');
        blkh(i, 1.0) = get(lineh(i), 'SrcBlockHandle');
        portIdx(i, 1.0) = get(porth(i), 'PortNumber');
    end % for
end
