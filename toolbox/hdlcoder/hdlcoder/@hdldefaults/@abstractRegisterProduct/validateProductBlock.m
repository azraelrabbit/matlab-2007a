function v = validateProductBlock(this, hC)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    v = hdlvalidatestruct;
    % 23 24
    MessageID = 'abstractRegisterProduct:validateProductBlock';
    Status = 1.0;
    % 26 27
    bfp = hC.SimulinkHandle;
    % 28 29
    inputsigns = get_param(bfp, 'Inputs');
    inputsigns = strrep(inputsigns, '|', '');
    % 31 33
    % 32 33
    if not(isempty(strfind(inputsigns, '/')))
        Message = 'Product block with these inputs (/) is not supported.';
        v(plus(end, 1.0)) = hdlvalidatestruct(Status, Message, MessageID);
    end % if
    % 37 38
    if not(strcmpi(get_param(bfp, 'Multiplication'), 'element-wise(.*)'))
        Message = 'Product block only supported in Element-wise(.*) mode.';
        v(plus(end, 1.0)) = hdlvalidatestruct(Status, Message, MessageID);
    end % if
    % 42 43
    tmpv = this.validatePortDatatypes(hC);
    % 44 45
    if tmpv.Status
        v(plus(end, 1.0)) = hdlvalidatestruct(tmpv.Status, tmpv.Message, tmpv.MessageID);
    end % if
end % function
