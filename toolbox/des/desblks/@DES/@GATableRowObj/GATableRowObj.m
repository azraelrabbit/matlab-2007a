function h = GATableRowObj(block, hObj, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    h = DES.GATableRowObj(block);
    h.SrcBlockObj = hObj;
    % 15 17
    % 16 17
    switch numel(varargin)
    case 0.0
        % 19 20
        h.SrcAttributeName = 'Attribute1';
        h.SrcAttributeMissing = 'Error';
        h.SrcAttributeDefaultValue = '1';
        h.SrcAttributeTreatAsVector = true;
        h.SrcAttributeSendTiming = 'After entity departure';
    case 1.0
        h.SrcAttributeName = varargin{1.0}.SrcAttributeName;
        h.SrcAttributeMissing = varargin{1.0}.SrcAttributeMissing;
        h.SrcAttributeDefaultValue = varargin{1.0}.SrcAttributeDefaultValue;
        h.SrcAttributeTreatAsVector = varargin{1.0}.SrcAttributeTreatAsVector;
        h.SrcAttributeSendTiming = varargin{1.0}.SrcAttributeSendTiming;
    case 5.0
        h.SrcAttributeName = varargin{1.0};
        h.SrcAttributeMissing = varargin{2.0};
        h.SrcAttributeDefaultValue = varargin{3.0};
        h.SrcAttributeTreatAsVector = varargin{4.0};
        h.SrcAttributeSendTiming = varargin{5.0};
    otherwise
        error(horzcat('Unsupported number of input arguments', numel(varargin), 'to the SATableRowObj constructor'));
    end % switch
end % function
