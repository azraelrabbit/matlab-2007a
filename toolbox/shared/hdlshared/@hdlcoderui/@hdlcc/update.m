function update(hSrc, event)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if not(hdlcoderui.isslhdlcinstalled)
        return;
    end % if
    % 9 12
    % 10 12
    if strcmp(event, 'attach') && isempty(hSrc.mdlName)
        if not(isempty(hSrc.getSourceObject))
            hSrc.mdlName = getModelName(hSrc);
            hSrc.HDLCoder = slhdlcoder.HDLCoder;
            registerEventsForModel(hSrc, hSrc.mdlName);
        end % if
    end % if
    % 18 21
    % 19 21
    if strcmp(event, 'activate')
        % 21 23
        if not(isempty(hSrc.HDLCoder)) && not(isempty(hSrc.HDLCoder.StartNodeName)) && not(isempty(hSrc.HDLConfigFileStr))
            hSrc.HDLCoder.loadConfigfiles(cellhorzcat(hSrc.HDLConfigFileStr));
        end % if
    end % if
