function mdlNames = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mdlNames = '';
    % 9 11
    for i=1.0:length(c.LoopList)
        if c.LoopList(i).Active
            if not(isempty(mdlNames))
                mdlNames = horzcat(mdlNames, ', ');
            end
            thisMdl = c.LoopList(i).MdlName;
            if strcmp(thisMdl, '$current')
                thisMdl = xlate('current model');
            else
                if strcmp(thisMdl, '$all')
                    thisMdl = xlate('all open models');
                else
                    if strcmp(thisMdl, '$pwd')
                        thisMdl = xlate('current directory');
                    end
                end
            end
            mdlNames = horzcat(mdlNames, thisMdl);
        end
    end % for
end
