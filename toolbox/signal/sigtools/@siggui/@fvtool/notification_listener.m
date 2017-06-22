function notification_listener(hObj, eventData, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    NTypes = set(eventData, 'NotificationType');
    NType = get(eventData, 'NotificationType');
    % 9 11
    hFVT = getcomponent(hObj, 'fvtool');
    % 11 14
    % 12 14
    switch NType
    case NTypes{2.0}
        lclcheckwarning(hObj, eventData, varargin{:});
    otherwise
        send(hObj, 'Notification', eventData);
    end
end
function lclcheckwarning(hObj, eventData, varargin)
    % 21 24
    % 22 24
    if isa(eventData.Source, 'sigresp.abstractanalysis') && lt(nargin, 3.0)
        % 24 29
        % 25 29
        % 26 29
        % 27 29
        frw = get(hObj, 'FiltRespWarnings');
        if isempty(frw)
            frw = eventData;
        else
            frw(plus(end, 1.0)) = eventData;
        end
        set(hObj, 'FiltRespWarnings', frw);
    else
        % 36 38
        lstr = eventData.Data.WarningString;
        lid = eventData.Data.WarningID;
        % 39 42
        % 40 42
        lid = fliplr(strtok(fliplr(lid), ':'));
        % 42 44
        % 43 45
        if (any(strcmpi(lid, {'syntaxchanged','NextPlotNew','usemethod'}))) | (findstr(lower(lstr), 'axes limit range too small'))
            return
        else
            switch lower(lstr)
            case lower(horzcat(xlate('Negative data ignored'), '.'))
                eventData.Data.WarningString = 'Negative frequencies ignored when using log scale.';
            case cellhorzcat(lower(horzcat(xlate('Log of zero'), '.')), lower(horzcat(xlate('Divide by zero'), '.')))
                return
            end
        end
        % 54 56
        send(hObj, 'Notification', eventData);
        % 56 58
    end
end
