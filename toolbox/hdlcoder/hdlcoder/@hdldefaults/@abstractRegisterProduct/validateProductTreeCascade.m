function v = validateProductTreeCascade(this, hC)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    v = hdlvalidatestruct;
    % 24 26
    % 25 26
    MessageID = 'abstractRegisterProduct:validateProductTreeCascade';
    Status = 1.0;
    % 28 31
    % 29 31
    % 30 31
    tmpv = this.validateProductBlock(hC);
    % 32 33
    if not(isempty(tmpv))
        for i=tmpv
            if i.Status
                v(plus(end, 1.0)) = i;
            end % if
        end % for
    end % if
    % 40 42
    % 41 42
    in1 = hC.InputPorts(1.0).getSignal;
    in1vect = hdlsignalvector(in1);
    vectorsize = max(in1vect);
    % 45 47
    % 46 47
    if gt(length(hC.InputPorts), 1.0) || lt(vectorsize, 2.0)
        Message = 'Product block with cascade implementation requires a single vector as input.';
        v(plus(end, 1.0)) = hdlvalidatestruct(Status, Message, MessageID);
    end % if
end % function
