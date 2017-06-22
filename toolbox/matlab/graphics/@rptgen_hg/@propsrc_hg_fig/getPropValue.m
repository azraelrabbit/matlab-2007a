function [pValue, propName] = getPropValue(this, objList, propName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch propName
    case {'PaperSize','PaperPosition'}
        pValue = feval(horzcat('LocProp', propName), objList);
    otherwise
        [pValue, propName] = getCommonPropValue(this, objList, propName);
    end % switch
function valCells = LocPropPaperPosition(figHandles)
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    valCells = rptgen.safeGet(figHandles, 'PaperPosition');
    % 18 21
    % 19 21
    for i=1.0:length(valCells)
        currCell = valCells{i};
        valCells{i} = sprintf('(%0.2f, %0.2f) %0.2f x %0.2f', currCell(1.0), currCell(2.0), currCell(3.0), currCell(4.0));
        % 23 25
    end % for
function valCells = LocPropPaperSize(figHandles)
    % 26 30
    % 27 30
    % 28 30
    valCells = rptgen.safeGet(figHandles, 'PaperSize');
    % 30 32
    for i=1.0:length(valCells)
        currCell = valCells{i};
        valCells{i} = sprintf('%0.2f x %0.2f', currCell(1.0), currCell(2.0));
    end % for
