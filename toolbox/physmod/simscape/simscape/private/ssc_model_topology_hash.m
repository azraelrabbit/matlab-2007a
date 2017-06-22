function hash = ssc_model_topology_hash(mdl, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    error(nargchk(1.0, 2.0, nargin, 'struct'));
    % 10 11
    if eq(nargin, 1.0)
        hashType = 'crc';
    else
        hashType = varargin{1.0};
    end % if
    % 16 18
    % 17 18
    if not(isa(mdl, 'Simulink.BlockDiagram'))
        mdl = get_param(mdl, 'Object');
    end % if
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    pmBlockHandles = ssc_get_pm_blocks(mdl);
    % 26 28
    % 27 28
    refBlocks = get_param(pmBlockHandles, 'ReferenceBlock');
    portConnectivity = get_param(pmBlockHandles, 'PortConnectivity');
    % 30 33
    % 31 33
    % 32 33
    if not(iscell(refBlocks))
        refBlocks = cellhorzcat(refBlocks);
    end % if
    % 36 37
    if not(iscell(portConnectivity))
        portConnectivity = cellhorzcat(portConnectivity);
    end % if
    % 40 48
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    pmConnectivityData = repmat(struct('RefBlock', '', 'Ports', ''), 1.0, numel(pmBlockHandles));
    hashData = zeros(mtimes(4.0, numel(pmBlockHandles)), 1.0, 'uint32');
    for idx=1.0:numel(pmBlockHandles)
        pmConnectivityData(idx).RefBlock = refBlocks{idx};
        ports = portConnectivity{idx};
        ports = rmfield(ports, {'Position','SrcPort','DstPort'});
        idx3 = 1.0;
        portData = struct('Type', '', 'SrcBlock', '', 'DstBlock', '');
        for idx2=1.0:numel(ports)
            if not(isempty(strfind(ports(idx2).Type, 'Conn')))
                if not(isempty(ports(idx2).SrcBlock)) || not(isempty(ports(idx2).DstBlock))
                    portData(idx3).Type = ports(idx2).Type;
                    portData(idx3).SrcBlock = sort(get_param(ports(idx2).SrcBlock, 'ReferenceBlock'));
                    portData(idx3).DstBlock = sort(get_param(ports(idx2).DstBlock, 'ReferenceBlock'));
                    idx3 = plus(idx3, 1.0);
                end % if
            end % if
        end % for
        pmConnectivityData(idx).Ports = portData;
        % 67 74
        % 68 74
        % 69 74
        % 70 74
        % 71 74
        % 72 74
        % 73 74
        hashData(minus(mtimes(4.0, idx), 3.0):mtimes(4.0, idx)) = pm_hash('md5', pmConnectivityData(idx));
    end % for
    % 76 79
    % 77 79
    % 78 79
    hash = pm_hash(hashType, sort(hashData));
end % function
