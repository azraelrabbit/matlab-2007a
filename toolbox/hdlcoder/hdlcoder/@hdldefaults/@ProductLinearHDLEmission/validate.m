function v = validate(this, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    v = hdlvalidatestruct;
    % 9 10
    Status = 1.0;
    MessageID = 'ProductLinearHDLEmission:validate';
    % 12 14
    % 13 14
    tmpv = this.validateProductBlock(hC);
    % 15 16
    if not(isempty(tmpv))
        for i=tmpv
            v(plus(end, 1.0)) = i;
        end % for
    end % if
    % 21 22
    if gt(length(hC.InputPorts), 2.0)
        Message = 'Product block with more than two inputs is not supported.';
        v(plus(end, 1.0)) = hdlvalidatestruct(Status, Message, MessageID);
    end % if
end % function
