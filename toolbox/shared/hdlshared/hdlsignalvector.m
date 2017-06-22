function vector = hdlsignalvector(idx)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if hdlisbeta2
        % 7 11
        % 8 11
        % 9 11
        if gt(length(idx), 1.0)
            error('Internal error: hdlsignalvector called with vector of PIR signal handles');
        end
        % 13 15
        tpinfo = pirgetdatatypeinfo(idx.Type);
        if strcmpi(idx.type.getClassName, 'tp_array')
            if eq(idx.Type.numberofDimensions, 1.0)
                if eq(idx.Type.isRowVector, 1.0)
                    vector = horzcat(1.0, double(tpinfo.vector(1.0)));
                else
                    if eq(idx.Type.isColumnVector, 1.0)
                        vector = horzcat(double(tpinfo.vector(1.0)), 1.0);
                    else
                        vector = double(tpinfo.vector(1.0));
                    end
                end
            else
                vector = 'Matrix';
            end
        else
            vector = double(tpinfo.vector);
        end
    else
        % 33 36
        % 34 36
        signalTable = hdlgetsignaltable;
        signalTable.checkSignalIndices(idx);
        vector = signalTable.getVector(idx);
        % 38 40
    end
end
