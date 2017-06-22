function hdlcode = emitBlockComments(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hdlcode = hdlcodeinit;
    % 8 9
    bfp = hC.SimulinkHandle;
    % 10 11
    desc = get_param(bfp, 'Description');
    if not(isempty(desc))
        hdlcode.arch_body_blocks = hdlformatcomment(desc, 2.0);
    end % if
end % function
