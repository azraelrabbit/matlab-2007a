function setArgPosition(hSrc, portName, pos)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if lt(pos, 1.0) || gt(pos, length(hSrc.Data))
        DAStudio.error('RTW:fcnClass:invalidArgPos');
        return
    end
    % 20 22
    namesInArgSpec = get(hSrc.Data, 'SLObjectName');
    if isempty(namesInArgSpec)
        DAStudio.error('RTW:fcnClass:noConfigFound', portName);
        return
    else
        if not(iscell(namesInArgSpec))
            namesInArgSpec = cellhorzcat(namesInArgSpec);
        end
    end
    [numOfFound, currPos] = ismember(portName, namesInArgSpec);
    if gt(numOfFound, 0.0)
        if eq(currPos, pos)
            return
        end
        argConf = hSrc.Data(currPos);
        argConf.Position = pos;
        % 37 39
        if gt(pos, currPos)
            for index=plus(currPos, 1.0):pos
                temp = hSrc.Data(index);
                temp.Position = minus(temp.Position, 1.0);
                hSrc.Data(minus(index, 1.0)) = temp;
            end % for
            hSrc.Data(pos) = argConf;
        else
            for index=currPos:-1.0:plus(pos, 1.0)
                temp = hSrc.Data(minus(index, 1.0));
                temp.Position = plus(temp.Position, 1.0);
                hSrc.Data(index) = temp;
            end % for
            hSrc.Data(pos) = argConf;
        end
        return
    else
        DAStudio.error('RTW:fcnClass:noConfigFound', portName);
        return
    end
end
