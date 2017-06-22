function h = SATableRowObj(block, hObj, varargin)
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
    % 16 17
    h = DES.SATableRowObj(block);
    h.SrcBlockObj = hObj;
    % 19 21
    % 20 21
    switch numel(varargin)
    case 0.0
        % 23 24
        h.SrcAttributeName = 'Attribute1';
        h.SrcAttributeFrom = 'Dialog';
        h.SrcAttributeValue = '1';
        h.SrcAttributeTreatAsVector = true;
    case 1.0
        % 29 30
        h.SrcAttributeName = varargin{1.0}.SrcAttributeName;
        h.SrcAttributeFrom = varargin{1.0}.SrcAttributeFrom;
        h.SrcAttributeValue = varargin{1.0}.SrcAttributeValue;
        h.SrcAttributeTreatAsVector = varargin{1.0}.SrcAttributeTreatAsVector;
    case 4.0
        % 35 36
        h.SrcAttributeName = varargin{1.0};
        h.SrcAttributeFrom = varargin{2.0};
        h.SrcAttributeValue = varargin{3.0};
        h.SrcAttributeTreatAsVector = varargin{4.0};
    otherwise
        error(horzcat('Unsupported number of input arguments', numel(varargin), 'to the SATableRowObj constructor'));
    end % switch
end % function
