function [SL_info, srcInfo, errstat] = getSignalRTO(H, varargin)
    % 1 27
    % 2 27
    % 3 27
    % 4 27
    % 5 27
    % 6 27
    % 7 27
    % 8 27
    % 9 27
    % 10 27
    % 11 27
    % 12 27
    % 13 27
    % 14 27
    % 15 27
    % 16 27
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    errstat = false;
    SL_info = {};
    % 29 31
    % 30 31
    [lineh, porth, blkh, portIdx] = H.parse_sl_path(varargin{:});
    % 32 34
    % 33 34
    srcInfo.blkh = blkh;
    srcInfo.portIdx = portIdx;
    % 36 38
    % 37 38
    if isempty(blkh)
        errorHandler('A valid Simulink signal was not selected.');
        errstat = true;
        return;
    end % if
    % 43 46
    % 44 46
    % 45 46
    stat = get_param(bdroot(blkh(1.0)), 'SimulationStatus');
    if strcmpi(stat, 'stopped')
        errorHandler('Simulink model must be running or paused when connecting');
        errstat = true;
        % 50 51
        srcInfo.blkh = [];
        return;
    end % if
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    % 60 61
    [porth, i] = unique(porth);
    lineh = lineh(i);
    blkh = blkh(i);
    portIdx = portIdx(i);
    % 65 68
    % 66 68
    % 67 68
    srcInfo.blkh = blkh;
    srcInfo.portIdx = portIdx;
    % 70 73
    % 71 73
    % 72 73
    driver = get_all_nonvirtual_driver(lineh, blkh, portIdx);
    % 74 76
    % 75 76
    numSignals = numel(driver);
    for j=1.0:numSignals
        keep_info = [];
        dj = driver(j);
        % 80 82
        % 81 82
        numDrivers = numel(dj.rto);
        % 83 84
        for i=1.0:numDrivers
            thisRTO = dj.rto{i};
            thisIdx = dj.portIdx{i};
            % 87 88
            numD2 = numel(thisRTO);
            for k=1.0:numD2
                % 90 91
                RTOk = thisRTO(k);
                hPort = OutputPort(RTOk, thisIdx);
                % 93 95
                % 94 95
                sig_info.dims = hPort.dimensions;
                sig_info.dtype = hPort.datatype;
                sig_info.cplx = not(strcmpi(hPort.complexity, 'real'));
                sig_info.Ts = RTOk.SampleTimes;
                % 99 102
                % 100 102
                % 101 102
                if eq(i, 1.0)
                    sig_info.BusExpansion = gt(numD2, 1.0);
                    keep_info = sig_info;
                else
                    if not(isequal(sig_info, keep_info))
                        errorHandler('All driver signals must have identical attributes');
                        errstat = true;
                        % 109 110
                        srcInfo.blkh = [];
                        return;
                    end % if
                end % if
            end % for
        end % for
        sizes(j) = keep_info;
    end % for
    % 118 121
    % 119 121
    % 120 121
    SL_info.numSignals = numSignals;
    SL_info.sizes = sizes;
    SL_info.driver = driver;
end % function
function driver = get_all_nonvirtual_driver(lineh, blkh, portIdx)
    % 126 142
    % 127 142
    % 128 142
    % 129 142
    % 130 142
    % 131 142
    % 132 142
    % 133 142
    % 134 142
    % 135 142
    % 136 142
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    % 141 142
    for i=1.0:numel(lineh)
        % 143 145
        % 144 145
        driver(i) = get_one_nonvirtual_driver(lineh(i));
        % 146 159
        % 147 159
        % 148 159
        % 149 159
        % 150 159
        % 151 159
        % 152 159
        % 153 159
        % 154 159
        % 155 159
        % 156 159
        % 157 159
        % 158 159
        isBusSelector = strcmpi(get(blkh(i), 'blocktype'), 'busselector');
        if isBusSelector
            rto = driver(i).rto;
            if gt(numel(rto), 1.0)
                driver(i).rto = rto(portIdx(i));
            end % if
        end % if
        % 166 170
        % 167 170
        % 168 170
        % 169 170
        isDemux = strcmpi(get(blkh(i), 'blocktype'), 'demux');
        if isDemux
            errorHandler('Demux blocks are not supported');
            % 173 174
            srcInfo.blkh = [];
            return;
        end % if
        % 177 178
        Nj = numel(driver(i).porth);
        % 179 181
        % 180 181
        if eq(Nj, 1.0)
            driver(i).portIdx = cellhorzcat(driver(i).portIdx);
            driver(i).porttype = cellhorzcat(driver(i).porttype);
            driver(i).blkh = cellhorzcat(driver(i).blkh);
            driver(i).rto = cellhorzcat(driver(i).rto);
        end % if
        % 187 214
        % 188 214
        % 189 214
        % 190 214
        % 191 214
        % 192 214
        % 193 214
        % 194 214
        % 195 214
        % 196 214
        % 197 214
        % 198 214
        % 199 214
        % 200 214
        % 201 214
        % 202 214
        % 203 214
        % 204 214
        % 205 214
        % 206 214
        % 207 214
        % 208 214
        % 209 214
        % 210 214
        % 211 214
        % 212 214
        % 213 214
        for j=1.0:Nj
            if not(strcmpi(driver(i).porttype{j}, 'outport'))
                msg = sprintf('Driver signal #%d driven by port type "%s"\nCan only connect to signals driven by Output ports', i, driver(i).porttype{j});
                % 217 219
                % 218 219
                errorHandler(msg);
                % 220 221
                srcInfo.blkh = [];
                return;
            end % if
        end % for
    end % for
end % function
function driver = get_one_nonvirtual_driver(lineh)
    % 228 232
    % 229 232
    % 230 232
    % 231 232
    port_i = get_param(lineh, 'NonVirtualSrcPorts');
    driver.porth = port_i;
    driver.portIdx = get_param(port_i, 'portnumber');
    driver.porttype = get_param(port_i, 'porttype');
    blk_i = get_param(port_i, 'parent');
    driver.blkh = get_param(blk_i, 'handle');
    driver.rto = get_param(blk_i, 'runtimeobject');
end % function
function errorHandler(specificIssue)
    % 241 243
    % 242 243
    msg = sprintf('%s', specificIssue);
    uiwait(errordlg(msg, 'MPlay Simulink Connection Error', 'modal'));
end % function
