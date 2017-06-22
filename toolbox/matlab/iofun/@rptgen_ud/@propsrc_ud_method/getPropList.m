function pList = getPropList(psUD, filterName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    to = psUD.getTestObject;
    % 8 9
    pList = vertcat(fieldnames(get(to(1.0))), {'InputTypes';'OutputTypes';'Varargout';'Varargin'});
    % 10 14
    % 11 14
    % 12 14
    % 13 14
end % function
