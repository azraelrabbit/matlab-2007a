function makeQe_Test(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if h.isWriteHeader
        % 8 10
        % 9 10
        fid = h.openFile('qe_test.m');
        % 11 12
        fwrite(fid, sprintf('function ok=qe_test(this,d)\n%%QE_TEST tests the component\n'));
        % 13 14
        h.writeHeader(fid);
        % 15 16
        fwrite(fid, sprintf('ok=true;\nd.appendPoint(this);\nqe_test_outlinestring(this);\n'));
        % 17 18
        fclose(fid);
        % 19 20
        h.viewFile('qe_test.m');
    end % if
end % function
