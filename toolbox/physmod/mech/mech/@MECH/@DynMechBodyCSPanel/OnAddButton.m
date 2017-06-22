function OnAddButton(hThis, dlgSrc, objSrc, tagStr, widgetVal)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    nFrames = numel(hThis.WorkFrames);
    % 8 9
    focusFrame = plus(hThis.FocusItem(1.0), 1.0);
    % 10 11
    newFrameIdx = plus(focusFrame, 1.0);
    % 12 13
    hNewFrame = MECH.MechFrameHelper(hThis.WorkFrames(focusFrame));
    % 14 15
    hNewFrame.Name = l_GenNewName(hThis.WorkFrames);
    % 16 18
    % 17 18
    hPrevFrame = hNewFrame;
    for swapIdx=newFrameIdx:plus(nFrames, 1.0)
        if le(swapIdx, nFrames)
            hTmpFrame = hThis.WorkFrames(swapIdx);
            hThis.WorkFrames(swapIdx) = hPrevFrame;
            hPrevFrame = hTmpFrame;
        else
            hThis.WorkFrames(plus(end, 1.0)) = hPrevFrame;
        end % if
    end % for
    % 28 29
    dlgSrc.enableApplyButton(true);
    dlgSrc.refresh();
    dlgSrc.resetSize(false);
end % function
function newName = l_GenNewName(frameLst)
    % 34 35
    nFrames = numel(frameLst);
    % 36 37
    for suffIdx=1.0:1000.0
        tmpName = horzcat('CS', num2str(suffIdx));
        matchFound = false;
        % 40 42
        % 41 42
        for frameIdx=1.0:nFrames
            if strcmpi(frameLst(frameIdx).Name, tmpName)
                matchFound = true;
                break
            end % if
        end % for
        % 48 49
        if not(matchFound)
            newName = tmpName;
            break
        end % if
    end % for
end % function
